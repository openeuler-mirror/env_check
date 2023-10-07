#!/usr/bin/python3
# -*- coding: utf-8 -*-
import os
import sys
import json
import stat
import importlib
import logging
import argparse

LOCAL_PATH = "/usr/local/env_check/sut"

LOG_FORMAT = "%(asctime)s - %(levelname)s - %(message)s"
logging.basicConfig(filename='env_check.log', level=logging.DEBUG, format=LOG_FORMAT)

BLACK_LIST = (
    "__init__", "base_check_actor", "__pycache__", "oe_base_actor", "example_actor"
)

BLACK_CLASS = ('OeBaseActor',)

EXCEPTION_SOLUTION = "程序异常，请查看日志"
EXCEPTION_MESSAGE = {}
EXCEPTION_FAILED_REASON = "程序异常，请查看日志"


class ReturnMessage(object):
    def __init__(self, result=True, solution="", message=None, failed_reason=""):
        self.result = result
        self.solution = solution
        self.message = message or {}
        self.failed_reason = failed_reason


class EnvCheck(object):
    def __init__(self, node={}):
        self.actors_result = []
        self.finished_actor = 0
        self.total_actor = 0
        self.node = node
        self.return_message = {}
        self.pass_actors = 0
        self.result = True
        self.register_func = {}


    def load_actor(self, actor_dir=""):
        if actor_dir == "":
            actor_dir = LOCAL_PATH
        check_actor_path = os.path.join(actor_dir, 'env_check/check_actor')

        if not os.path.exists(check_actor_path):
            logging.error(f"The directory does not exist: {check_actor_path}")
            raise Exception(f"The directory does not exist: {check_actor_path}")
        sys.path.append(os.path.dirname(actor_dir))

        all_actors = []
        for file in os.listdir(check_actor_path):
            file_prefix = file.split('.')[0]
            if file_prefix not in BLACK_LIST:
                all_actors.append(file.split(".py")[0].split(".cpython")[0])
            else:
                logging.warning(f"file will not import, cause file {file} in black list.")
        return all_actors


    def import_actor(self, all_actors):
        logging.info(f"Start import model list is {all_actors}")
        for actor in all_actors:
            module = f"sut.env_check.check_actor.{actor}"
            try:
                import_md = importlib.import_module(module)
                for ob in dir(import_md):
                    if ob.endswith('Actor') and ob not in BLACK_CLASS:
                        register_actor = getattr(import_md, ob)
                        self.register_func[ob] = register_actor

            except ModuleNotFoundError as ex:
                logging.warning(f"Import module {module} error,because {ex}")
                continue
            logging.info(f"Import {module} success")


    def _analyse_actor_message(self, message: dict):
        for key in message.keys():
            self.return_message[key] = message.get(key)

    def _analyse_actor_result(self, actor, actor_message: ReturnMessage):
        is_break = False
        self.finished_actor += 1
        actor_result = {}
        actor_result["actor_name"] = actor.name
        actor_result["actor_description"] = actor.description
        actor_result["actor_priority"] = actor.priority
        actor_result["actor_result"] = actor_message.result
        actor_result["actor_solution"] = actor_message.solution
        actor_result["failed_reason"] = actor_message.failed_reason
        if not actor_message.result and actor.priority == "mandatory":
            logging.info(f"actor {actor.name} executed failed")
            is_break = True
        else:
            logging.info(f"actor {actor.name} executed finished")

        if actor_message.result:
            self.pass_actors += 1
        if actor_message.message:
            logging.info(f"start to update message: {actor_message.message}")
            self._analyse_actor_message(actor_message.message)
        self.actors_result.append(actor_result)
        logging.info(self.actors_result)
        return is_break

    def _get_all_running_actors(self):
        running_actors = []
        running_actors_name = []
        for actor_name, actor in self.register_func.items():
            running_actors.append(actor)
            running_actors_name.append(actor_name)
            logging.info(f"actor {actor_name} will be running")

        logging.info(f"running actor is {running_actors_name}")
        self.total_actor = len(running_actors)
        return running_actors

    def run_actors(self):
        actors = self._get_all_running_actors()
        for actor in actors:
            logging.info(f"running actor:{actor.name}")
            try:
                actor_message = actor.run(self.node)
            except Exception as ex:
                logging.error(f"actor {actor.name} running error,reason is {ex} ")
                actor_message = ReturnMessage(result=False,
                                              solution=EXCEPTION_SOLUTION,
                                              message=EXCEPTION_MESSAGE,
                                              failed_reason=EXCEPTION_FAILED_REASON)
            is_break = self._analyse_actor_result(actor, actor_message)
            if is_break:
                logging.info("EnvTest failed")
                self.result = False

    def get_valid_path(self, result_path=""):
        if not result_path:
            result_path = LOCAL_PATH
        if not os.path.exists(result_path):
            os.makedirs(result_path)
            os.chmod(result_path, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP)

        output_path = os.path.join(result_path, 'env-check-result.json')
        return output_path


    def _gen_report(self):
        report = {}
        report["result"] = self.result
        report["total_count"] = self.total_actor
        report["pass"] = self.pass_actors
        report["no_pass"] = self.total_actor - self.pass_actors
        report["detail"] = self.actors_result
        return report

    def save_result(self, result_path):
        logging.info("Start save actor result......")
        output_path = env_check.get_valid_path(result_path)
        result_data = self._gen_report()
        try:
            data_str = json.dumps(result_data, default=lambda obj: obj.__dict__, indent=2)
        except (TypeError, ValueError) as err:
            logging.error("Generate json file {0} failed, please check your raw data!".format(output_path))
            raise Exception("Generate json file {0} failed, please check your raw data!".format(output_path))
        try:
            with os.fdopen(os.open(output_path, os.O_WRONLY | os.O_CREAT | os.O_TRUNC, 0o660), 'w') as json_file:
                json_file.write(data_str)
        except OSError as err:
            logging.error("Generate json file {0} failed, please check your raw data!".format(result_path))
            raise Exception("Generate json file {0} failed, please check your raw data!".format(result_path))
        else:
            os.chmod(output_path, stat.S_IRUSR | stat.S_IWUSR | stat.S_IRGRP)
            print(f'The result has been saved {output_path}')


if __name__ == "__main__":
    parse = argparse.ArgumentParser(description="A tool for 'health checking' after operating system upgrade")
    # 检查路径，默认当前目录
    parse.add_argument("--checkpath", type=str, default="", help="Environment check code path")
    # 报告输出路径，默认当前目录
    parse.add_argument("--outputpath", type=str, default="", help="Result output path")
    args = parse.parse_args()
    # 加载env_check/check_actor/目录下的actor
    print("------Start Check------")
    env_check = EnvCheck()
    all_actors = env_check.load_actor(args.checkpath)
    if not all_actors:
        logging.warning("No actor needs to be executed.Check whether the actor exists in directory env_check/check_actor/")
        sys.exit(1)
    print("Load Actors Success......")
    # 导入actor
    env_check.import_actor(all_actors)
    print("Import Actors Success......")
    # 运行
    actors_result = env_check.run_actors()
    print("Run Actors Success......")
    # 保存结果
    env_check.save_result(args.outputpath)
    print("Save Results Success......")
    print("------Finish Check------")

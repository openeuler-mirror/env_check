# -*- coding: utf-8 -*-

import os
import subprocess
from sut.env_check.check_actor.base_check_actor import BaseCheckActor, ReturnMessage
X2_LOG_DIR = '/var/log/x2openEuler'


class OeBaseActor(BaseCheckActor):
    name = "OeBaseActor"
    description = "this is openEuler base test actor."
    level = "low"
    priority = "unnecessary"
    task_type = (BaseCheckActor.task_type.SYSTEM_UPGRADE,)

    sh_dir = os.path.join(os.path.abspath(os.path.dirname(
        os.path.dirname(os.path.abspath(__file__)))), 'smoke_test/local_sh')
    sh_file = ''


    @classmethod
    def run(cls, node):
        print(f"start {cls.sh_file} check")
        message = dict()
        sh_file_path = os.path.join(cls.sh_dir, cls.sh_file)
        if not os.path.exists(sh_file_path):
            solution = f'Add the test script: {sh_file_path}'
            failed_reason = f'The test case script does not exist: {sh_file_path}'
            return ReturnMessage(BaseCheckActor.FAIL, solution, message, failed_reason)

        status, _ = subprocess.getstatusoutput(' '.join(['bash', '-x', sh_file_path]))
        print(f'The result of running the {cls.sh_file} script is {status}')
        if status == 0:
            result = BaseCheckActor.SUCCESS
            solution = ''
            failed_reason = ""
        else:
            result = BaseCheckActor.FAIL
            log_path = os.path.join(X2_LOG_DIR, 'smoke-test', cls.sh_file.split('.')[0])
            solution = f'Check the logs in the {log_path} directory.'
            failed_reason = f"Failed to execute the script: {sh_file_path}"
        return ReturnMessage(result, solution, message, failed_reason)

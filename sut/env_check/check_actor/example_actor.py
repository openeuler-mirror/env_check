# -*- coding: utf-8 -*-

"""
    actor示例
"""

from sut.env_check.check_actor.base_check_actor import BaseCheckActor, ReturnMessage


class ExampleActor(BaseCheckActor):
    name = "ExampleActor"
    description = "this is test"
    level = "High"
    priority = "mandatory"
    task_type = (BaseCheckActor.task_type.SYSTEM_UPGRADE,)

    @staticmethod
    def run(node):
        solution = ""
        message = {"node_name": "xxxxx"}
        return ReturnMessage(BaseCheckActor.SUCCESS, solution, message, "")


#! /usr/bin/env python
# -*- coding: utf-8 -*-
"""
Create: 2023-01-10
Content: 任务基类
"""


class TaskType(object):
    SYSTEM_UPGRADE = "system_upgrade"
    CONFIG_MIGRATE = "config_migrate"
    SYSTEM_INFO_COLLECT_EVALUATION = "system_info_collect_evaluation"


class ReturnMessage(object):
    def __init__(self, result=True, solution="", message=None, failed_reason=""):
        self.result = result
        self.solution = solution
        self.message = message or {}
        self.failed_reason = failed_reason


class BaseCheckActor(object):
    SUCCESS = True
    FAIL = False

    task_type = TaskType

    name = ""
    description = ""
    level = ""
    priority = ""

    @staticmethod
    def run(node):
        result = ReturnMessage(result=True, solution="", message={}, failed_reason="")
        return result

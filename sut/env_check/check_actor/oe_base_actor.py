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

# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBzip2Actor(OeBaseActor):
    name = "OeBzip2Actor"
    description = "Test the bzip2 command of the openEuler system."
    sh_file = '06_basic_commands_2/oe_test01_bzip2.sh'

class OeBzip2recoverActor(OeBaseActor):
    name = "OeBzip2recoverActor"
    description = "Test the bzip2recover command of the openEuler system."
    sh_file = '06_basic_commands_2/oe_test02_bzip2recover.sh'

class OeBzmoreActor(OeBaseActor):
    name = "OeBzmoreActor"
    description = "Test the bzmore command of the openEuler system."
    sh_file = '06_basic_commands_2/oe_test03_bzmore.sh'


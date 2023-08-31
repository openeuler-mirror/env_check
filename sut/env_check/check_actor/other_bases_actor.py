# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBcActor(OeBaseActor):
    name = "OeBcActor"
    description = "Test the bc command of the openEuler system."
    sh_file = 'oe_test01_bc.sh'
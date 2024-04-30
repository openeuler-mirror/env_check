# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeCdActor(OeBaseActor):
    name = "OeCdActor"
    description = "Test the cd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test01_cd.sh'
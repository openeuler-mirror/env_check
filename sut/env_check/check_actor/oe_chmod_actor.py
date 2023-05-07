# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor


class OeChmodActor(OeBaseActor):
    name = "OeChmodActor"
    description = "Test the chmod command of the openEuler system."
    sh_file = 'oe_test_chmod_001.sh'


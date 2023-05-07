# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor


class OeCpActor(OeBaseActor):
    name = "OeCpActor"
    description = "Test the cp command of the openEuler system."
    sh_file = 'oe_test_cp_001.sh'


# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor


class OeCatActor(OeBaseActor):
    name = "OeCatActor"
    description = "Test the cat command of the openEuler system."
    sh_file = 'oe_test_cat_001.sh'


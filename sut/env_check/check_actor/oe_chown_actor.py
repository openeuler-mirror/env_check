# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor


class OeChownActor(OeBaseActor):
    name = "OeChownActor"
    description = "Test the chown command of the openEuler system."
    sh_file = 'oe_test_chown_001.sh'


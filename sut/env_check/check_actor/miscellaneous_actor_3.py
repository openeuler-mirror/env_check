# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChronycActor(OeBaseActor):
    name = "OeChronycActor"
    description = "Test the chronyc command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test08_chronyc.sh'

class OeChvtActor(OeBaseActor):
    name = "OeChvtActor"
    description = "Test the chvt command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test14_chvt.sh'
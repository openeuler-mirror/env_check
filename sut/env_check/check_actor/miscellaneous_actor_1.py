# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChownActor(OeBaseActor):
    name = "OeChownActor"
    description = "Test the chown command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test06_chown.sh'

class OeChrpathActor(OeBaseActor):
    name = "OeChrpathActor"
    description = "Test the chrpath command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test12_chrpath.sh'

class OeClockActor(OeBaseActor):
    name = "OeClockActor"
    description = "Test the clock command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test18_clock.sh'
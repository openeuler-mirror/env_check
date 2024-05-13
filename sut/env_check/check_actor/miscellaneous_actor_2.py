# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChpasswdActor(OeBaseActor):
    name = "OeChpasswdActor"
    description = "Test the chpasswd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test07_chpasswd.sh'

class OeChrtActor(OeBaseActor):
    name = "OeChrtActor"
    description = "Test the chrt command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test13_chrt.sh'
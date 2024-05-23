# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChmodActor(OeBaseActor):
    name = "OeChmodActor"
    description = "Test the chmod command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test10_chmod.sh'

class OeCiptoolActor(OeBaseActor):
    name = "OeCiptoolActor"
    description = "Test the ciptool command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test16_ciptool.sh'

class OeCpActor(OeBaseActor):
    name = "OeCpActor"
    description = "Test the cp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test22_cp.sh'
    
class OeCracklibpackerActor(OeBaseActor):
    name = "OeCracklib-packerActor"
    description = "Test the cracklib-packer command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test28_cracklib-packer.sh'

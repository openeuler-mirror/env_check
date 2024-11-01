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
    
class OePython37Actor(OeBaseActor):
    name = "OePython37Actor"
    description = "Test the python3.7 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test35_python3.7.sh'

class OePythondebugconfigActor(OeBaseActor):
    name = "OePythondebugconfigActor"
    description = "Test the python-debug-config command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test41_python-debug-config.sh'
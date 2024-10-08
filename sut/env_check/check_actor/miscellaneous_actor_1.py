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
    
class OeCppActor(OeBaseActor):
    name = "OeCppActor"
    description = "Test the cpp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test24_cpp.sh'
    
class OePythonActor(OeBaseActor):
    name = "OePythonActor"
    description = "Test the python command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test31_python.sh'


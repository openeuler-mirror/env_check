# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeCdActor(OeBaseActor):
    name = "OeCdActor"
    description = "Test the cd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test01_cd.sh'
    
class OeChgrpActor(OeBaseActor):
    name = "OeChgrpActor"
    description = "Test the chgrp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test02_chgrp.sh'
    
class OeChkconfigActor(OeBaseActor):
    name = "OeChkconfigActor"
    description = "Test the chkconfig command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test03_chkconfig.sh'

class OeChkrootkitActor(OeBaseActor):
    name = "OeChkrootkitActor"
    description = "Test the chkrootkit command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test04_chkrootkit.sh'
    
    

class OeCreatecracklibdictActor(OeBaseActor):
    name = "OeCcreate-cracklib-dictActor"
    description = "Test the create-cracklib-dict command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test30_create-cracklib-dict.sh'
    
class OePythonActor(OeBaseActor):
    name = "OePythonActor"
    description = "Test the python command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test31_python.sh'

class OePythonActor(OeBaseActor):
    name = "OePythonActor"
    description = "Test the python command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test31_python2.sh'

class OePythonActor(OeBaseActor):
    name = "OePythonActor"
    description = "Test the python command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test31_python3.sh'
# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeCdActor(OeBaseActor):
    name = "OeCdActor"
    description = "Test the cd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test01_cd.sh'
    
class OeChkrootkitActor(OeBaseActor):
    name = "OeChkrootkitActor"
    description = "Test the chkrootkit command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test04_chkrootkit.sh'
class OeChgrpActor(OeBaseActor):
    name = "OeChgrpActor"
    description = "Test the chgrp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test02_chgrp.sh'

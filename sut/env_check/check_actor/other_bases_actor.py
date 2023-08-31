# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBcActor(OeBaseActor):
    name = "OeBcActor"
    description = "Test the bc command of the openEuler system."
    sh_file = 'oe_test01_bc.sh'
    
class OeCalActor(OeBaseActor):
    name = "OeCalActor"
    description = "Test the cal command of the openEuler system."
    sh_file = 'oe_test02_cal.sh'
    
class OeClearActor(OeBaseActor):
    name = "OeClearActor"
    description = "Test the clear command of the openEuler system."
    sh_file = 'oe_test03_clear.sh'
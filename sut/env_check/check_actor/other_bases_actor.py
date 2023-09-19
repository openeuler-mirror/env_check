# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBcActor(OeBaseActor):
    name = "OeBcActor"
    description = "Test the bc command of the openEuler system."
    sh_file = '06_other_base/oe_test01_bc.sh'
    
class OeCalActor(OeBaseActor):
    name = "OeCalActor"
    description = "Test the cal command of the openEuler system."
    sh_file = '06_other_base/oe_test02_cal.sh'

class OeClearActor(OeBaseActor):
    name = "OeClearActor"
    description = "Test the clear command of the openEuler system."
    sh_file = '06_other_base/oe_test03_clear.sh'
    
class OeConsoletypeActor(OeBaseActor):
    name = "OeConsoletypeActor"
    description = "Test the consoletype command of the openEuler system."
    sh_file = '06_other_base/oe_test04_consoletype.sh'
    
class OeCtrlaltdelActor(OeBaseActor):
    name = "OeCtrlaltdelActor"
    description = "Test the ctrlaltdel command of the openEuler system."
    sh_file = '06_other_base/oe_test05_ctrlaltdel.sh'
    
class OeDateActor(OeBaseActor):
    name = "OeDateActor"
    description = "Test the date command of the openEuler system."
    sh_file = '06_other_base/oe_test06_date.sh'
    
class OeDircolorsActor(OeBaseActor):
    name = "OeDircolorsActor"
    description = "Test the dircolors command of the openEuler system."
    sh_file = '06_other_base/oe_test07_dircolors.sh'
# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor    
    
class OeGpasswdActor(OeBaseActor):
    name = "OeGpasswdActor"
    description = "Test the gpasswd command of the openEuler system."
    sh_file = '07_user_management/oe_test07_gpasswd.sh'
    

class OeGroupaddActor(OeBaseActor):
    name = "OeGroupaddActor"
    description = "Test the groupadd command of the openEuler system."
    sh_file = '07_user_management/oe_test07_groupadd.sh'    

class OeGroupdelActor(OeBaseActor):
    name = "OeGroupdelActor"
    description = "Test the groupdel command of the openEuler system."
    sh_file = '07_user_management/oe_test07_groupdel.sh'
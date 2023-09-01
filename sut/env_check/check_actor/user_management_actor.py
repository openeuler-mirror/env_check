# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor    
    
class OeGpasswdActor(OeBaseActor):
    name = "OeGpasswdActor"
    description = "Test the gpasswd command of the openEuler system."
    sh_file = '07_user_management/oe_test07_gpasswd.sh'
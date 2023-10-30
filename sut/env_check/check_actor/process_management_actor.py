# -*- coding: utf-8 -*-
# Create: 2023-10-31
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeInitActor(OeBaseActor):
    name = "OeInitActor"
    description = "Test the init command of the openEuler system."
    sh_file = '08_process_management/oe_test01_init.sh'

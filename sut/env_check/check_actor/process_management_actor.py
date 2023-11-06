# -*- coding: utf-8 -*-
# Create: 2023-10-30
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeInitActor(OeBaseActor):
    name = "OeInitActor"
    description = "Test the init command of the openEuler system."
    sh_file = '08_process_management/oe_test01_init.sh'
    
class OeKillallActor(OeBaseActor):
    name = "OeKillallActor"
    description = "Test the killall command of the openEuler system."
    sh_file = '08_process_management/oe_test02_killall.sh'

class OeNiceActor(OeBaseActor):
    name = "OeNiceActor"
    description = "Test the nice command of the openEuler system."
    sh_file = '08_process_management/oe_test03_nice.sh'

class OeNohupActor(OeBaseActor):
    name = "OeNohupActor"
    description = "Test the nohup command of the openEuler system."
    sh_file = '08_process_management/oe_test04_nohup.sh'
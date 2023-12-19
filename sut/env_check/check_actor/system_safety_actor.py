# -*- coding: utf-8 -*-
# Create: 2023-12-18
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeChrootActor(OeBaseActor):
    name = "OeChrootActor"
    description = "Test the chroot command of the openEuler system."
    sh_file = '12_system_safety/oe_test01_chroot.sh'

class OeNmapActor(OeBaseActor):
    name = "OeNmapActor"
    description = "Test the nmap command of the openEuler system."
    sh_file = '12_system_safety/oe_test02_nmap.sh'
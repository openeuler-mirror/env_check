# -*- coding: utf-8 -*-
# Create: 2023-12-19
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeAwkActor(OeBaseActor):
    name = "OeAwkActor"
    description = "Test the awk command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test01_awk.sh'
# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeArpActor(OeBaseActor):
    name = "OeArpActor"
    description = "Test the arp command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test01_arp.sh'

class OeIpcalcActor(OeBaseActor):
    name = "OeIpcalcActor"
    description = "Test the ipcalc command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test02_ipcalc.sh'
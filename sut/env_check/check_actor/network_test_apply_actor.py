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
    
class OeNetstatActor(OeBaseActor):
    name = "OeNetstatActor"
    description = "Test the netstat command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test03_netstat.sh'

class OePingActor(OeBaseActor):
    name = "OePingActor"
    description = "Test the ping command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test04_ping.sh'

class OeTelnetActor(OeBaseActor):
    name = "OeTelnetActor"
    description = "Test the telnet command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test05_telnet.sh'
    
class OeWgetActor(OeBaseActor):
    name = "OeWgetActor"
    description = "Test the wget command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test06_wget.sh'

class OeHostActor(OeBaseActor):
    name = "OeHostActor"
    description = "Test the wget command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test07_host.sh'

class OeDigActor(OeBaseActor):
    name = "OeDigActor"
    description = "Test the wget command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test08_dig.sh'

class OeArpingActor(OeBaseActor):
    name = "OeArpingActor"
    description = "Test the arping command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test09_arping.sh'

class OePing6Actor(OeBaseActor):
    name = "OePing6Actor"
    description = "Test the ping6 command of the openEuler system."
    sh_file = '16_network_test_and_apply/oe_test10_ping6.sh'

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeIplinkActor(OeBaseActor):
    name = "OeIplinkActor"
    description = "Test the iplink command of the openEuler system."
    sh_file = '17_advnet_cmd_directories/oe_test01_iplink.sh'
class OeIpaddrActor(OeBaseActor):
    name = "OeIpaddrActor"
    description = "Test the iplink command of the openEuler system."
    sh_file = '17_advnet_cmd_directories/oe_test02_ipaddr.sh'
class OeIprouteActor(OeBaseActor):
    name = "OeIprouteActor"
    description = "Test the iplink command of the openEuler system."
    sh_file = '17_advnet_cmd_directories/oe_test03_iproute.sh'
class OeIpneighActor(OeBaseActor):
    name = "OeIpneighActor"
    description = "Test the iplink command of the openEuler system."
    sh_file = '17_advnet_cmd_directories/oe_test04_ipneigh.sh'	
class OeIptablesActor(OeBaseActor):
    name = "OeIptablesActor"
    description = "Test the iplink command of the openEuler system."
    sh_file = '17_advnet_cmd_directories/oe_test05_iptables.sh'

class OeIptablessvaeActor(OeBaseActor):
    name = "OeIptablessaveActor"
    description = "Test the iptables-save command of the openEuler system."
    sh_file = '17_advnet_cmd_directories/oe_test06_iptables-save.sh'


from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeDnsdomainnameActor(OeBaseActor):
    name = "OeDnsdomainnameActor"
    description = "Test the dnsdomainname cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test01_dnsdomainname.sh"

class OeDomainnameActor(OeBaseActor):
    name = "OeDomainnameActor"
    description = "Test the domainname cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test02_domainname.sh"

class OeHostnameActor(OeBaseActor):
    name = "OeHostnameActor"
    description = "Test the hostname cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test03_hostname.sh"

class OeIfcfgActor(OeBaseActor):
    name = "OeIfcfgActor"
    description = "Test the ifcfg cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test04_ifcfg.sh"

class OeIfconfigActor(OeBaseActor):
    name = "OeIfconfigActor"
    description = "Test the ifconfig cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test05_ifconfig.sh"

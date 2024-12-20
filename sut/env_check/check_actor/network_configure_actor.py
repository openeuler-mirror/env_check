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

class OeIfdownActor(OeBaseActor):
    name = "OeIfdownActor"
    description = "Test the ifdown cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test06_ifdown.sh"

class OeIfupActor(OeBaseActor):
    name = "OeIfupActor"
    description = "Test the ifup cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test07_ifup.sh"

class OeNisdomainnameActor(OeBaseActor):
    name = "OeNisdomainnameActor"
    description = "Test the nisdomainname cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test08_nisdomainname.sh"

class OeRouteActor(OeBaseActor):
    name = "OeRouteActor"
    description = "Test the route cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test09_route.sh"

class OeYpdomainnameActor(OeBaseActor):
    name = "OeYpdomainnameActor"
    description = "Test the ypdomainname cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test10_ypdomainname.sh"

class OeNmcliActor(OeBaseActor):
    name = "OeNmcliActor"
    description = "Test the nmcli cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test11_nmcli.sh"
class OeNladdrlistActor(OeBaseActor):
    name = "OeNladdrlistActor"
    description = "Test the nl-addr-list cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test13_nl-addr-list.sh"


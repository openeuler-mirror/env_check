from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeDnsdomainnameActor(OeBaseActor):
    name = "OeDnsdomainnameActor"
    description = "Test the dnsdomainname cmmand of the openEuler system."
    sh_file = "15_network_configure/oe_test01_dnsdomainname.sh"

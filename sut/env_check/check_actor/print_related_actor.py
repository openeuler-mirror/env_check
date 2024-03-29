from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeAcceptActor(OeBaseActor):
    name = "OeAcceptActor"
    description = "Test the accept cmmand of the openEuler system."
    sh_file = "05_print_related/oe_test01_accept.sh"

class OeCancelActor(OeBaseActor):
    name = "OeCancelActor"
    description = "Test the cancel cmmand of the openEuler system."
    sh_file = "05_print_related/oe_test02_cancel.sh"

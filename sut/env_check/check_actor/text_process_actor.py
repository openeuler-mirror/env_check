from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeCksumActor(OeBaseActor):
    name = "OeCksumActor"
    description = "Test the cksum command of the openEuler system."
    sh_file = '03_text_process/oe_test01_cksum.sh'

class OeCmpActor(OeBaseActor):
    name = "OeCmpActor"
    description = "Test the cmp cmmand of the openEuler system."
    sh_file = '03_text_process/oe_test02_cmp.sh'

class OeColActor():
    name = "OeColActor"
    destription = ""
    sh_file = "03_text_process/oe_test03_col.sh"

class OeColrmActor():
    name = "OeColrmActor"
    destription = ""
    sh_file = "03_text_process/oe_test04_colrm.sh"

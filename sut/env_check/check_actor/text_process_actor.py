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
    description = "Test the col cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test03_col.sh"

class OeColrmActor():
    name = "OeColrmActor"
    description = "Test the colrm cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test04_colrm.sh"

class OeCommActor():
    name = "OeCommActor"
    description = "Test the comm cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test05_comm.sh"

class OeCsplitActor():
    name = "OeCsplitActor"
    description = "Test the csplit cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test06_csplit.sh"

class OeCutActor():
    name = "OeCutActor"
    description = "Test the cut cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test07_cut.sh"

class OeDiff3Actor():
    name = "OeDiff3Actor"
    description = "Test the diff3 cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test08_diff3.sh"

class OeDiffActor():
    name = "OeDiffActor"
    description = "Test the diff cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test09_diff.sh"

class OeDiffstatActor():
    name = "OeDiffstatActor"
    description = "Test the diffstat cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test10_diffstat.sh"

class OeEdActor():
    name = "OeEdActor"
    description = "Test the ed cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test11_ed.sh"

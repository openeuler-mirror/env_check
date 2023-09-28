from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeCksumActor(OeBaseActor):
    name = "OeCksumActor"
    description = "Test the cksum command of the openEuler system."
    sh_file = '03_text_process/oe_test01_cksum.sh'

class OeCmpActor(OeBaseActor):
    name = "OeCmpActor"
    description = "Test the cmp cmmand of the openEuler system."
    sh_file = '03_text_process/oe_test02_cmp.sh'

class OeColActor(OeBaseActor):
    name = "OeColActor"
    description = "Test the col cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test03_col.sh"

class OeColrmActor(OeBaseActor):
    name = "OeColrmActor"
    description = "Test the colrm cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test04_colrm.sh"

class OeCommActor(OeBaseActor):
    name = "OeCommActor"
    description = "Test the comm cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test05_comm.sh"

class OeCsplitActor(OeBaseActor):
    name = "OeCsplitActor"
    description = "Test the csplit cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test06_csplit.sh"

class OeCutActor(OeBaseActor):
    name = "OeCutActor"
    description = "Test the cut cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test07_cut.sh"

class OeDiff3Actor(OeBaseActor):
    name = "OeDiff3Actor"
    description = "Test the diff3 cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test08_diff3.sh"

class OeDiffActor(OeBaseActor):
    name = "OeDiffActor"
    description = "Test the diff cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test09_diff.sh"

class OeDiffstatActor(OeBaseActor):
    name = "OeDiffstatActor"
    description = "Test the diffstat cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test10_diffstat.sh"

class OeEdActor(OeBaseActor):
    name = "OeEdActor"
    description = "Test the ed cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test11_ed.sh"

class OeEmacsActor(OeBaseActor):
    name = "OeEmacsActor"
    description = "Test the emacs cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test12_emacs.sh"

class OeExActor(OeBaseActor):
    name = "OeExActor"
    description = "Test the ex cmmand of the openEuler system."
    sh_file = "03_text_process/oe_test13_ex.sh"

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class TextProcessActor(OeBaseActor):
    name = "TextProcessActor"
    description = "Test the text process command of the openEuler system."
    sh_file = '03_text_process/oe_test01_cksum.sh'

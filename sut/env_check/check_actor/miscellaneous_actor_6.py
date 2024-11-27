# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChmemActor(OeBaseActor):
    name = "OeChmemActor"
    description = "Test the chmem command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test11_chmem.sh'

class OeCjpegActor(OeBaseActor):
    name = "OeCjpegActor"
    description = "Test the cjpeg command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test17_cjpeg.sh'

class OeCpioActor(OeBaseActor):
    name = "OeCpioActor"
    description = "Test the cpio command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test23_cpio.sh'
    
class OeCracklibunpackerActor(OeBaseActor):
    name = "OeCracklib-unpackerActor"
    description = "Test the cracklib-unpacker command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test29_cracklib-unpacker.sh'
    
class OePython27configActor(OeBaseActor):
    name = "OePython27configActor"
    description = "Test the python2.7-config command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test36_python2.7-config.sh'
    
class OePython2configActor(OeBaseActor):
    name = "OePython2configActor"
    description = "Test the python2-config command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test42_python2-config.sh'
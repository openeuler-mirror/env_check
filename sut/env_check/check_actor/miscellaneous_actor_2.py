# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChpasswdActor(OeBaseActor):
    name = "OeChpasswdActor"
    description = "Test the chpasswd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test07_chpasswd.sh'

class OeChrtActor(OeBaseActor):
    name = "OeChrtActor"
    description = "Test the chrt command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test13_chrt.sh'

class OeClockdiffActor(OeBaseActor):
    name = "OeClockdiffActor"
    description = "Test the clockdiff command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test19_clockdiff.sh'
    
class OeCpupowerActor(OeBaseActor):
    name = "OeCpupowerActor"
    description = "Test the cpupower command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test25_cpupower.sh'
    
class OePython2Actor(OeBaseActor):
    name = "OePython2Actor"
    description = "Test the python2 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test32_python2.sh'
    
class OePython27debugActor(OeBaseActor):
    name = "OePython27debugActor"
    description = "Test the python2.7-debug command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test38_python2.7-debug.sh'
# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeCdActor(OeBaseActor):
    name = "OeCdActor"
    description = "Test the cd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test01_cd.sh'
    
class OeChgrpActor(OeBaseActor):
    name = "OeChgrpActor"
    description = "Test the chgrp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test02_chgrp.sh'

class OeChkconfigActor(OeBaseActor):
    name = "OeChkconfigActor"
    description = "Test the chkconfig command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test03_chkconfig.sh'

class OeChkrootkitActor(OeBaseActor):
    name = "OeChkrootkitActor"
    description = "Test the chkrootkit command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test04_chkrootkit.sh'
    
class OeChoomActor(OeBaseActor):
    name = "OeChoomActor"
    description = "Test the choom command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test05_choom.sh'
    
class OeChownActor(OeBaseActor):
    name = "OeChownActor"
    description = "Test the chown command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test06_chown.sh'

class OeChpasswdActor(OeBaseActor):
    name = "OeChpasswdActor"
    description = "Test the chpasswd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test07_chpasswd.sh'

class OeChronycActor(OeBaseActor):
    name = "OeChronycActor"
    description = "Test the chronyc command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test08_chronyc.sh'

class OeChronydActor(OeBaseActor):
    name = "OeChronydActor"
    description = "Test the chronyd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test09_chronyd.sh'

class OeChmodActor(OeBaseActor):
    name = "OeChmodActor"
    description = "Test the chmod command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test10_chmod.sh'

class OeChmemActor(OeBaseActor):
    name = "OeChmemActor"
    description = "Test the chmem command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test11_chmem.sh'

class OeChrpathActor(OeBaseActor):
    name = "OeChrpathActor"
    description = "Test the chrpath command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test12_chrpath.sh'

class OeChrtActor(OeBaseActor):
    name = "OeChrtActor"
    description = "Test the chrt command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test13_chrt.sh'

class OeChvtActor(OeBaseActor):
    name = "OeChvtActor"
    description = "Test the chvt command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test14_chvt.sh'
    
class OeCifsiostatActor(OeBaseActor):
    name = "OeCifsiostatActor"
    description = "Test the cifsiostat command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test15_cifsiostat.sh'

class OeCiptoolActor(OeBaseActor):
    name = "OeCiptoolActor"
    description = "Test the ciptool command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test16_ciptool.sh'

class OeCjpegActor(OeBaseActor):
    name = "OeCjpegActor"
    description = "Test the cjpeg command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test17_cjpeg.sh'

class OeClockActor(OeBaseActor):
    name = "OeClockActor"
    description = "Test the clock command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test18_clock.sh'

class OeClockdiffActor(OeBaseActor):
    name = "OeClockdiffActor"
    description = "Test the clockdiff command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test19_clockdiff.sh'
    
    
class OeCmsutilActor(OeBaseActor):
    name = "OeCmsutilActor"
    description = "Test the cmsutil command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test20_cmsutil.sh'
    
class OeCorelistActor(OeBaseActor):
    name = "OeCorelistActor"
    description = "Test the corelist command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test21_corelist.sh'

class OeCpActor(OeBaseActor):
    name = "OeCpActor"
    description = "Test the cp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test22_cp.sh'
    
class OeCpioActor(OeBaseActor):
    name = "OeCpioActor"
    description = "Test the cpio command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test23_cpio.sh'
    
class OeCppActor(OeBaseActor):
    name = "OeCppActor"
    description = "Test the cpp command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test24_cpp.sh'
    
class OeCpupowerActor(OeBaseActor):
    name = "OeCpupowerActor"
    description = "Test the cpupower command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test25_cpupower.sh'

# 在 Python 中，类名通常不包含连字符，虽然这不是严格禁止的，但可能会导致一些混淆或错误。    
class OeCracklibcheckActor(OeBaseActor):
    name = "OeCracklib-checkActor"
    description = "Test the cracklib-check command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test26_cracklib-check.sh'
    
class OeCracklibformatActor(OeBaseActor):
    name = "OeCracklib-formatActor"
    description = "Test the cracklib-format command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test27_cracklib-format.sh'
    
class OeCracklibpackerActor(OeBaseActor):
    name = "OeCracklib-packerActor"
    description = "Test the cracklib-packer command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test28_cracklib-packer.sh'
    
class OeCracklibunpackerActor(OeBaseActor):
    name = "OeCracklib-unpackerActor"
    description = "Test the cracklib-unpacker command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test29_cracklib-unpacker.sh'
    
class OeCreatecracklibdictActor(OeBaseActor):
    name = "OeCcreate-cracklib-dictActor"
    description = "Test the create-cracklib-dict command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test30_create-cracklib-dict.sh'
    
class OePythonActor(OeBaseActor):
    name = "OePythonActor"
    description = "Test the python command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test31_python.sh'
    
class OePython2Actor(OeBaseActor):
    name = "OePython2Actor"
    description = "Test the python2 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test32_python2.sh'
    
class OePython3Actor(OeBaseActor):
    name = "OePython3Actor"
    description = "Test the python3 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test33_python3.sh'

class OePython27Actor(OeBaseActor):
    name = "OePython27Actor"
    description = "Test the python2.7 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test34_python2.7.sh'
    
class OePython37Actor(OeBaseActor):
    name = "OePython37Actor"
    description = "Test the python3.7 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test35_python3.7.sh'
    
class OePython27configActor(OeBaseActor):
    name = "OePython27configActor"
    description = "Test the python2.7-config command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test36_python2.7-config.sh'
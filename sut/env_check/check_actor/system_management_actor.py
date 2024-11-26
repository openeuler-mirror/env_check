# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeArchActor(OeBaseActor):
    name = "OeArchActor"
    description = "Test the arch command of the openEuler system."
    sh_file = '14_system_management/oe_test01_arch.sh'

class OeChkconfigActor(OeBaseActor):
    name = "OeChkconfigActor"
    description = "Test the chkconfig command of the openEuler system."
    sh_file = '14_system_management/oe_test02_chkconfig.sh'

class OeLastActor(OeBaseActor):
    name = "OeLastActor"
    description = "Test the last command of the openEuler system."
    sh_file = '14_system_management/oe_test03_last.sh'

class OeLastbActor(OeBaseActor):
    name = "OeLastbActor"
    description = "Test the lastb command of the openEuler system."
    sh_file = '14_system_management/oe_test04_lastb.sh'

class OeRunlevelActor(OeBaseActor):
    name = "OeRunlevelActor"
    description = "Test the runlevel command of the openEuler system."
    sh_file = '14_system_management/oe_test05_runlevel.sh'

class OeRpmActor(OeBaseActor):
    name = "OeRpmActor"
    description = "Test the rpm command of the openEuler system."
    sh_file = '14_system_management/oe_test06_rpm.sh'

class OeYumActor(OeBaseActor):
    name = "OeYumActor"
    description = "Test the yum command of the openEuler system."
    sh_file = '14_system_management/oe_test07_yum.sh'

class OeAnacronActor(OeBaseActor):
    name = "OeAnacronActor"
    description = "Test the anacron command of the openEuler system."
    sh_file = '14_system_management/oe_test08_anacron.sh'
class OeZramctlActor(OeBaseActor):
    name = "OeZramctlActor"
    description = "Test the zramctl command of the openEuler system."
    sh_file = '14_system_management/oe_test09_zramctl.sh'
class OeZipActor(OeBaseActor):
    name = "OeZipActor"
    description = "Test the zip command of the openEuler system."
    sh_file = '14_system_management/oe_test10_zip.sh'
class OeBccmdActor(OeBaseActor):
    name = "OeBccmdActor"
    description = "Test the bccmd command of the openEuler system."
    sh_file = '14_system_management/oe_test11_bccmd.sh'
class OeBclinuxAuthenticatorActor(OeBaseActor):
    name = "OeBclinuxAuthenticatorActor"
    description = "Test the bclinux-authenticator command of the openEuler system."
    sh_file = '14_system_management/oe_test12_bclinux-authenticator.sh'
class OeBclinuxLicenseActor(OeBaseActor):
    name = "OeBclinuxLicenseActor"
    description = "Test the bccmd command of the openEuler system."
    sh_file = '14_system_management/oe_test13_bclinux-license.sh'
class OeBgActor(OeBaseActor):
    name = "OeBgActor"
    description = "Test the bg command of the openEuler system."
    sh_file = '14_system_management/oe_test14_bg.sh'
class OeBiosdecodeActor(OeBaseActor):
    name = "OeBiosdecodeActor"
    description = "Test the biosdecode command of the openEuler system."
    sh_file = '14_system_management/oe_test15_biosdecode.sh'
class OeBlkdeactivateActor(OeBaseActor):
    name = "OeBlkdeactivateActor"
    description = "Test the blkdeactivate command of the openEuler system."
    sh_file = '14_system_management/oe_test16_blkdeactivate.sh'
class OeGdbusActor(OeBaseActor):
    name = "OeGdbusActor"
    description = "Test the gdbus command of the openEuler system."
    sh_file = '14_system_management/oe_test17_gdbus.sh'
class OeCrontabActor(OeBaseActor):
    name = "OeCrontabActor"
    description = "Test the crontab command of the openEuler system."
    sh_file = '14_system_management/oe_test19_crontab.sh'

class OeEnvActor(OeBaseActor):
    name = "OeEnvActor"
    description = "Test the crontab command of the openEuler system."
    sh_file = '14_system_management/oe_test20_env.sh'

class OeSystemdanalyzeActor(OeBaseActor):
    name = "OeSystemdanalyzzeActor"
    description = "Test the systemd-analyze command of the openEuler system."
    sh_file = '14_system_management/oe_test22_systemd-analyze.sh'

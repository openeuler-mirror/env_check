# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBcActor(OeBaseActor):
    name = "OeBcActor"
    description = "Test the bc command of the openEuler system."
    sh_file = '06_basic_commands/oe_test01_bc.sh'

class OeCalActor(OeBaseActor):
    name = "OeCalActor"
    description = "Test the cal command of the openEuler system."
    sh_file = '06_basic_commands/oe_test02_cal.sh'

class OeClearActor(OeBaseActor):
    name = "OeClearActor"
    description = "Test the clear command of the openEuler system."
    sh_file = '06_basic_commands/oe_test03_clear.sh'

class OeConsoletypeActor(OeBaseActor):
    name = "OeConsoletypeActor"
    description = "Test the consoletype command of the openEuler system."
    sh_file = '06_basic_commands/oe_test04_consoletype.sh'

class OeCtrlaltdelActor(OeBaseActor):
    name = "OeCtrlaltdelActor"
    description = "Test the ctrlaltdel command of the openEuler system."
    sh_file = '06_basic_commands/oe_test05_ctrlaltdel.sh'

class OeDateActor(OeBaseActor):
    name = "OeDateActor"
    description = "Test the date command of the openEuler system."
    sh_file = '06_basic_commands/oe_test06_date.sh'

class OeDircolorsActor(OeBaseActor):
    name = "OeDircolorsActor"
    description = "Test the dircolors command of the openEuler system."
    sh_file = '06_basic_commands/oe_test07_dircolors.sh'

class OeEjectActor(OeBaseActor):
    name = "OeEjectActor"
    description = "Test the eject command of the openEuler system."
    sh_file = '06_basic_commands/oe_test08_eject.sh'

class OeHostidActor(OeBaseActor):
    name = "OeHostidActor"
    description = "Test the hostid command of the openEuler system."
    sh_file = '06_basic_commands/oe_test09_hostid.sh'

class OeHwclockActor(OeBaseActor):
    name = "OeHwclockActor"
    description = "Test the hwclock command of the openEuler system."
    sh_file = '06_basic_commands/oe_test10_hwclock.sh'

class OeInfoActor(OeBaseActor):
    name = "OeInfoActor"
    description = "Test the info command of the openEuler system."
    sh_file = '06_basic_commands/oe_test11_info.sh'

class OeManActor(OeBaseActor):
    name = "OeManActor"
    description = "Test the man command of the openEuler system."
    sh_file = '06_basic_commands/oe_test12_man.sh'

class OeMd5sumActor(OeBaseActor):
    name = "OeMd5sumActor"
    description = "Test the md5sum command of the openEuler system."
    sh_file = '06_basic_commands/oe_test13_md5sum.sh'

class OeMesgActor(OeBaseActor):
    name = "OeMesgActor"
    description = "Test the mesg command of the openEuler system."
    sh_file = '06_basic_commands/oe_test14_mesg.sh'
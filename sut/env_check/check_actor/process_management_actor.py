# -*- coding: utf-8 -*-
# Create: 2023-10-30
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeInitActor(OeBaseActor):
    name = "OeInitActor"
    description = "Test the init command of the openEuler system."
    sh_file = '08_process_management/oe_test01_init.sh'

class OeKillallActor(OeBaseActor):
    name = "OeKillallActor"
    description = "Test the killall command of the openEuler system."
    sh_file = '08_process_management/oe_test02_killall.sh'

class OeNiceActor(OeBaseActor):
    name = "OeNiceActor"
    description = "Test the nice command of the openEuler system."
    sh_file = '08_process_management/oe_test03_nice.sh'

class OeNohupActor(OeBaseActor):
    name = "OeNohupActor"
    description = "Test the nohup command of the openEuler system."
    sh_file = '08_process_management/oe_test04_nohup.sh'

class OePgrepActor(OeBaseActor):
    name = "OePgrepActor"
    description = "Test the pgrep command of the openEuler system."
    sh_file = '08_process_management/oe_test05_pgrep.sh'

class OePidofActor(OeBaseActor):
    name = "OePidofActor"
    description = "Test the pidof command of the openEuler system."
    sh_file = '08_process_management/oe_test06_pidof.sh'

class OePkillActor(OeBaseActor):
    name = "OePkillActor"
    description = "Test the pkill command of the openEuler system."
    sh_file = '08_process_management/oe_test07_pkill.sh'

class OePsActor(OeBaseActor):
    name = "OePsActor"
    description = "Test the ps command of the openEuler system."
    sh_file = '08_process_management/oe_test08_ps.sh'

class OePstreeActor(OeBaseActor):
    name = "OePstreeActor"
    description = "Test the pstree command of the openEuler system."
    sh_file = '08_process_management/oe_test09_pstree.sh'

class OeReniceActor(OeBaseActor):
    name = "OeReniceActor"
    description = "Test the renice command of the openEuler system."
    sh_file = '08_process_management/oe_test10_renice.sh'

class OeWActor(OeBaseActor):
    name = "OeWActor"
    description = "Test the w command of the openEuler system."
    sh_file = '08_process_management/oe_test11_w.sh'

class OeWatchActor(OeBaseActor):
    name = "OeWatchActor"
    description = "Test the watch command of the openEuler system."
    sh_file = '08_process_management/oe_test12_watch.sh'

class OePidstatActor(OeBaseActor):
    name = "OePidstatActor"
    description = "Test the pidstat command of the openEuler system."
    sh_file = '08_process_management/oe_test13_pidstat.sh'

class OeLsofActor(OeBaseActor):
    name = "OeLsofActor"
    description = "Test the lsof command of the openEuler system."
    sh_file = '08_process_management/oe_test15_lsof.sh'
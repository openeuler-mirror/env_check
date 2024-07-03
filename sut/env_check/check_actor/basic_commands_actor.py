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

class OeMd5sumActor(OeBaseActor):
    name = "OeMd5sumActor"
    description = "Test the md5sum command of the openEuler system."
    sh_file = '06_basic_commands/oe_test12_md5sum.sh'

class OeMesgActor(OeBaseActor):
    name = "OeMesgActor"
    description = "Test the mesg command of the openEuler system."
    sh_file = '06_basic_commands/oe_test13_mesg.sh'
    
class OeMtoolsActor(OeBaseActor):
    name = "OeMtoolsActor"
    description = "Test the mtools command of the openEuler system."
    sh_file = '06_basic_commands/oe_test14_mtools.sh'
    
class OePoweroffActor(OeBaseActor):
    name = "OePoweroffActor"
    description = "Test the poweroff command of the openEuler system."
    sh_file = '06_basic_commands/oe_test15_poweroff.sh'

class OeRebootActor(OeBaseActor):
    name = "OeRebootActor"
    description = "Test the reboot command of the openEuler system."
    sh_file = '06_basic_commands/oe_test16_reboot.sh'
    
class OeShutdownActor(OeBaseActor):
    name = "OeShutdownActor"
    description = "Test the shutdown command of the openEuler system."
    sh_file = '06_basic_commands/oe_test17_shutdown.sh'

class OeSleepActor(OeBaseActor):
    name = "OeSleepActor"
    description = "Test the sleep command of the openEuler system."
    sh_file = '06_basic_commands/oe_test18_sleep.sh'

class OeStatActor(OeBaseActor):
    name = "OeStatActor"
    description = "Test the stat command of the openEuler system."
    sh_file = '06_basic_commands/oe_test19_stat.sh'

class OeWhoActor(OeBaseActor):
    name = "OeWhoActor"
    description = "Test the who command of the openEuler system."
    sh_file = '06_basic_commands/oe_test20_who.sh'

class OeYesActor(OeBaseActor):
    name = "OeYesActor"
    description = "Test the yes command of the openEuler system."
    sh_file = '06_basic_commands/oe_test21_yes.sh'

class OeAddftinfoActor(OeBaseActor):
    name = "OeAddftinfoActor"
    description = "Test the addftinfo command of the openEuler system."
    sh_file = '06_basic_commands/oe_test22_addftinfo.sh'

class OeAddgnupghomeActor(OeBaseActor):
    name = "OeAddgnupghomeActor"
    description = "Test the addgnupghome command of the openEuler system."
    sh_file = '06_basic_commands/oe_test23_addgnupghome.sh'

class OeAddpartActor(OeBaseActor):
    name = "OeAddpartActor"
    description = "Test the addpart command of the openEuler system."
    sh_file = '06_basic_commands/oe_test24_addpart.sh'

class OeAfmtoditActor(OeBaseActor):
    name = "OeAfmtoditActor"
    description = "Test the afmtodit command of the openEuler system."
    sh_file = '06_basic_commands/oe_test25_afmtodit.sh'

class OeAlternativesActor(OeBaseActor):
    name = "OeAlternativesActor"
    description = "Test the alternatives command of the openEuler system."
    sh_file = '06_basic_commands/oe_test26_alternatives.sh'

class OeApplygnupgdefaultsActor(OeBaseActor):
    name = "OeApplygnupgdefaultsActor"
    description = "Test the applygnupgdefaults command of the openEuler system."
    sh_file = '06_basic_commands/oe_test27_applygnupgdefaults.sh'

class OeArchpkgs2solvActor(OeBaseActor):
    name = "OeArchpkgs2solvActor"
    description = "Test the archpkgs2solv command of the openEuler system."
    sh_file = '06_basic_commands/oe_test31_archpkgs2solv.sh'

class OeArchrepo2solvActor(OeBaseActor):
    name = "OeArchrepo2solvActor"
    description = "Test the archrepo2solv command of the openEuler system."
    sh_file = '06_basic_commands/oe_test32_archrepo2solv.sh'

class OeAuditctlActor(OeBaseActor):
    name = "OeAuditctlActor"
    description = "Test the auditctl command of the openEuler system."
    sh_file = '06_basic_commands/oe_test33_auditctl.sh'

class OeAuditdActor(OeBaseActor):
    name = "OeAuditdActor"
    description = "Test the auditd command of the openEuler system."
    sh_file = '06_basic_commands/oe_test34_auditd.sh'

class OeAulastActor(OeBaseActor):
    name = "OeAulastActor"
    description = "Test the aulast command of the openEuler system."
    sh_file = '06_basic_commands/oe_test35_aulast.sh'

class OeAulastlogActor(OeBaseActor):
    name = "OeAulastlogActor"
    description = "Test the aulastlog command of the openEuler system."
    sh_file = '06_basic_commands/oe_test36_aulastlog.sh'

class OeAutoconfActor(OeBaseActor):
    name = "OeAutoconfActor"
    description = "Test the autoconf command of the openEuler system."
    sh_file = '06_basic_commands/oe_test37_autoconf.sh'

class OeAutogenActor(OeBaseActor):
    name = "OeAutogenActor"
    description = "Test the autogen command of the openEuler system."
    sh_file = '06_basic_commands/oe_test38_autogen.sh'

class OeAutoreconfActor(OeBaseActor):
    name = "OeAutoreconfActor"
    description = "Test the autoreconf command of the openEuler system."
    sh_file = '06_basic_commands/oe_test39_autoreconf.sh'

class OeAutoscanActor(OeBaseActor):
    name = "OeAutoscanActor"
    description = "Test the autoscan command of the openEuler system."
    sh_file = '06_basic_commands/oe_test40_autoscan.sh'

class OeB2sumActor(OeBaseActor):
    name = "OeB2sumActor"
    description = "Test the b2sum command of the openEuler system."
    sh_file = '06_basic_commands/oe_test41_b2sum.sh'

class OeBabeltraceActor(OeBaseActor):
    name = "OeBabeltraceActor"
    description = "Test the babeltrace command of the openEuler system."
    sh_file = '06_basic_commands/oe_test42_babeltrace.sh'

class OeBabeltracelogActor(OeBaseActor):
    name = "OeBabeltracelogActor"
    description = "Test the babeltrace-log command of the openEuler system."
    sh_file = '06_basic_commands/oe_test43_babeltrace-log.sh'

class OeBadblocksActor(OeBaseActor):
    name = "OeBadblocksActor"
    description = "Test the badblocks command of the openEuler system."
    sh_file = '06_basic_commands/oe_test44_badblocks.sh'

class OeBase32Actor(OeBaseActor):
    name = "OeBase32Actor"
    description = "Test the base32 command of the openEuler system."
    sh_file = '06_basic_commands/oe_test45_base32.sh'

class OeBase64Actor(OeBaseActor):
    name = "OeBase64Actor"
    description = "Test the base64 command of the openEuler system."
    sh_file = '06_basic_commands/oe_test46_base64.sh'

class OeBlkdiscardActor(OeBaseActor):
    name = "OeBlkdiscardActor"
    description = "Test the blkdiscard command of the openEuler system."
    sh_file = '06_basic_commands/oe_test47_blkdiscard.sh'

class OeBlkzoneActor(OeBaseActor):
    name = "OeBlkzoneActor"
    description = "Test the blkzone command of the openEuler system."
    sh_file = '06_basic_commands/oe_test49_blkzone.sh'

class OeBlockdevActor(OeBaseActor):
    name = "OeBlockdevActor"
    description = "Test the blockdev command of the openEuler system."
    sh_file = '06_basic_commands/oe_test50_blkdev.sh'

class OeBluemoonActor(OeBaseActor):
    name = "OeBluemoonActor"
    description = "Test the bluemoon command of the openEuler system."
    sh_file = '06_basic_commands/oe_test51_bluemoon.sh'

class OeBluetoothctlActor(OeBaseActor):
    name = "OeBluetoothctlActor"
    description = "Test the bluetoothctl command of the openEuler system."
    sh_file = '06_basic_commands/oe_test52_bluetoothctl.sh'

class OeBond2teamActor(OeBaseActor):
    name = "OeBond2teamActor"
    description = "Test the bond2team command of the openEuler system."
    sh_file = '06_basic_commands/oe_test53_bond2team.sh'

class OeBootctlActor(OeBaseActor):
    name = "OeBootctlActor"
    description = "Test the boootctl command of the openEuler system."
    sh_file = '06_basic_commands/oe_test54_bootctl.sh'

class OeBridgeActor(OeBaseActor):
    name = "OeBridgeActor"
    description = "Test the bridge command of the openEuler system."
    sh_file = '06_basic_commands/oe_test55_bridge.sh'

class OeBroadwaydActor(OeBaseActor):
    name = "OeBroadwaydActor"
    description = "Test the broadwayd command of the openEuler system."
    sh_file = '06_basic_commands/oe_test56_broadwayd.sh'

class OeBrotliActor(OeBaseActor):
    name = "OeBrotliActor"
    description = "Test the brotli command of the openEuler system."
    sh_file = '06_basic_commands/oe_test57_brotli.sh'

class OeBsdcatActor(OeBaseActor):
    name = "OeBsdcatActor"
    description = "Test the bsdcat command of the openEuler system."
    sh_file = '06_basic_commands/oe_test58_bsdcat.sh'

class OeBsdcpioActor(OeBaseActor):
    name = "OeBsdcpioActor"
    description = "Test the bsdcpio command of the openEuler system."
    sh_file = '06_basic_commands/oe_test59_bsdcpio.sh'

class OeBsdtarActor(OeBaseActor):
    name = "OeBsdtarActor"
    description = "Test the bsdtar command of the openEuler system."
    sh_file = '06_basic_commands/oe_test60_bsdtar.sh'

class OeBseActor(OeBaseActor):
    name = "OeBseActor"
    description = "Test the bse command of the openEuler system."
    sh_file = '06_basic_commands/oe_test61_bse.sh'

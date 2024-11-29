# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeAliasActor(OeBaseActor):
    name = "OeAliasActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test01_alias.sh'

class OeBindActor(OeBaseActor):
    name = "OeBindActor"
    description = "Test the bg command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test02_bind.sh'


class OeDeclareActor(OeBaseActor):
    name = "OeDeclareActor"
    description = "Test the declare command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test03_declare.sh'

class OeDirsActor(OeBaseActor):
    name = "OeDirsActor"
    description = "Test the dirs command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_dirs.sh'

class OeEchoActor(OeBaseActor):
    name = "OeEchoActor"
    description = "Test the echo command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test05_echo.sh'

class OeEnableActor(OeBaseActor):
    name = "OeEnableActor"
    description = "Test the enable command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test06_enable.sh'

class OeEvalactor(OeBaseActor):
    name = "OeEvalActor"
    description = "Test the enable command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test07_eval.sh'

class OeExecActor(OeBaseActor):
    name = "OeExecActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test08_exec.sh'

class OeExitActor(OeBaseActor):
    name = "OeExitActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test09_exit.sh'

class OeExportActor(OeBaseActor):
    name = "OeExportActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test10_export.sh'

class OeFcActor(OeBaseActor):
    name = "OeFcActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test11_fc.sh'

class OeHashActor(OeBaseActor):
    name = "OeHashActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test12_hash.sh'

class OeHistoryActor(OeBaseActor):
    name = "OeHistoryActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test13_history.sh'

class OeJobsActor(OeBaseActor):
    name = "OeJobsActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test14_jobs.sh'

class OeKillActor(OeBaseActor):
    name = "OeKillActor"
    description = "Test the kill command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test15_kill.sh'

class OeUnsettActor(OeBaseActor):
    name = "OeUnsettActor"
    description = "Test the unset command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test16_unset.sh'

class OePopdActor(OeBaseActor):
    name = "OePopdActor"
    description = "Test the popd command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test17_popd.sh'
class OePushdActor(OeBaseActor):
    name = "OePushdActor"
    description = "Test the push command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test18_push.sh'
class OeSetActor(OeBaseActor):
    name = "OeSetActor"
    description = "Test the set command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test19_set.sh'
class OeShoptActor(OeBaseActor):
    name = "OeShoptActor"
    description = "Test the shopt command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test20_shopt.sh'
class OeUlimitActor(OeBaseActor):
    name = "OeUlimitActor"
    description = "Test the ulimit command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test21_ulimit.sh'
class OeUmasktActor(OeBaseActor):
    name = "OeUmasktActor"
    description = "Test the umask command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test22_umask.sh'
class OeUnaliastActor(OeBaseActor):
    name = "OeUnaliastActor"
    description = "Test the unalias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test23_unalias.sh'
class OeAccessdbActor(OeBaseActor):
    name = "OeAccessdbActor"
    description = "Test the accessdb command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test24_accessdb.sh'
class OeAclocalActor(OeBaseActor):
    name = "OeAclocalActor"
    description = "Test the aclocal command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test25_aclocal.sh'
class OeAclocal116Actor(OeBaseActor):
    name = "OeAclocal116Actor"
    description = "Test the aclocal-1.16 command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test26_aclocal_1_16.sh'
class OeAgettyActor(OeBaseActor):
    name = "OeAgettyActor"
    description = "Test the agetty command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test27_agetty.sh'
class OeZstdmtActor(OeBaseActor):
    name = "OeZstdmtActor"
    description = "Test the zstdmt command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test28_zstdmt.sh'
class OeAppdata2solvActor(OeBaseActor):
    name = "OeAppdata2solvActor"
    description = "Test the appdata2solv command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test29_appdata2solv.sh'
class OeAproposActor(OeBaseActor):
    name = "OeAproposActor"
    description = "Test the apropos command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test30_apropos.sh'
class OeAsActor(OeBaseActor):
    name = "OeAsActor"
    description = "Test the as command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test31_as.sh'
class OeZipdetailsmtActor(OeBaseActor):
    name = "OeZipdetailsmtActor"
    description = "Test the zipdetails command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test32_zipdetails.sh'
class OeAugenrulesActor(OeBaseActor):
    name = "OeAugenrulesActor"
    description = "Test the augenrules command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test33_augenrules.sh'
class OeAureportActor(OeBaseActor):
    name = "OeAureportActor"
    description = "Test the aureport command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test34_aureport.sh'
class OeAusearchActor(OeBaseActor):
    name = "OeAusearchActor"
    description = "Test the ausearch command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test35_ausearch.sh'
class OeAusyscallActor(OeBaseActor):
    name = "OeAusyscallActor"
    description = "Test the ausyscall command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test36_ausyscall.sh'
class OeAutoheaderActor(OeBaseActor):
    name = "OeAutoheaderActor"
    description = "Test the autoheader command of the openEuler system."
    sh_file = 'extended/oe_test38_autoheader.sh'
class OeAutom4teActor(OeBaseActor):
    name = "OeAutom4teActor"
    description = "Test the autom4te command of the openEuler system."
    sh_file = 'extended/oe_test39_autom4te.sh'
class OeAutomakeActor(OeBaseActor):
    name = "OeAutomakeActor"
    description = "Test the automake command of the openEuler system."
    sh_file = 'extended/oe_test40_automake.sh'
class OeAutomake116Actor(OeBaseActor):
    name = "OeAutomake116Actor"
    description = "Test the automake-1.16 command of the openEuler system."
    sh_file = 'extended/oe_test41_automake_1_16.sh'
class OeAutoupdateActor(OeBaseActor):
    name = "OeAutoupdateActor"
    description = "Test the autoupdate command of the openEuler system."
    sh_file = 'extended/oe_test42_autoupdate.sh'
class OeAutraceActor(OeBaseActor):
    name = "OeAutraceActor"
    description = "Test the autrace command of the openEuler system."
    sh_file = 'extended/oe_test43_autrace.sh'
class OeAuvirtActor(OeBaseActor):
    name = "OeAuvirtActor"
    description = "Test the auvirt command of the openEuler system."
    sh_file = 'extended/oe_test44_auvirt.sh'
class OeAvcstatActor(OeBaseActor):
    name = "OeAvcstatActor"
    description = "Test the avcstat command of the openEuler system."
    sh_file = 'extended/oe_test45_avcstat.sh'
class OeBasencActor(OeBaseActor):
    name = "OeBasencActor"
    description = "Test the basenc command of the openEuler system."
    sh_file = 'extended/oe_test46_basenc.sh'
class OeBashActor(OeBaseActor):
    name = "OeBashActor"
    description = "Test the bash command of the openEuler system."
    sh_file = 'extended/oe_test47_bash.sh'
class OeBashbugActor(OeBaseActor):
    name = "OeBashbugActor"
    description = "Test the bashbug command of the openEuler system."
    sh_file = 'extended/oe_test48_bashbug.sh'
class OeFactorActor(OeBaseActor):
    name = "OeFactortActor"
    description = "Test the factor command of the openEuler system."
    sh_file = 'extended/oe_test49_factor.sh'
class OeTimeoutActor(OeBaseActor):
    name = "OeTimeoutActor"
    description = "Test the timeout command of the openEuler system."
    sh_file = 'extended/oe_test51_timeout.sh'
class OeCaptoinfoActor(OeBaseActor):
    name = "OeCaptoinfoActor"
    description = "Test the factor command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test54_captoinfo.sh'

# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeAliasActor(OeBaseActor):
    name = "OeAliasActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_alias.sh'

class OeBindActor(OeBaseActor):
    name = "OeBindActor"
    description = "Test the bg command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_bind.sh'


class OeDeclareActor(OeBaseActor):
    name = "OeDeclareActor"
    description = "Test the declare command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_declare.sh'

class OeDirsActor(OeBaseActor):
    name = "OeDirsActor"
    description = "Test the dirs command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_dirs.sh'

class OeEchoActor(OeBaseActor):
    name = "OeEchoActor"
    description = "Test the echo command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_echo.sh'

class OeEnableActor(OeBaseActor):
    name = "OeEnableActor"
    description = "Test the enable command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_enable.sh'

class OeEvalactor(OeBaseActor):
    name = "OeEvalActor"
    description = "Test the enable command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_eval.sh'

class OeExecActor(OeBaseActor):
    name = "OeExecActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_exec.sh'

class OeExitActor(OeBaseActor):
    name = "OeExitActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_exit.sh'

class OeExportActor(OeBaseActor):
    name = "OeExportActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_export.sh'

class OeFcActor(OeBaseActor):
    name = "OeFcActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_fc.sh'		

class OeHashActor(OeBaseActor):
    name = "OeHashActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_hash.sh'

class OeHistoryActor(OeBaseActor):
    name = "OeHistoryActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_history.sh'

class OeJobsActor(OeBaseActor):
    name = "OeJobsActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_jobs.sh'	

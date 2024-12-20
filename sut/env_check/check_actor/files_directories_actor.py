# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBasenameActor(OeBaseActor):
    name = "OeBasenameActor"
    description = "Test the basename command of the openEuler system."
    sh_file = '01_files_directories/oe_test01_basename.sh'

class OeCdActor(OeBaseActor):
    name = "OeCdActor"
    description = "Test the cd command of the openEuler system."
    sh_file = '01_files_directories/oe_test02_cd.sh'

class OeCpActor(OeBaseActor):
    name = "OeCpActor"
    description = "Test the cp command of the openEuler system."
    sh_file = '01_files_directories/oe_test03_cp.sh'

class OeChownActor(OeBaseActor):
    name = "OeChownActor"
    description = "Test the chown command of the openEuler system."
    sh_file = '01_files_directories/oe_test04_chown.sh'

class OeChmodActor(OeBaseActor):
    name = "OeChmodActor"
    description = "Test the chmod command of the openEuler system."
    sh_file = '01_files_directories/oe_test05_chmod.sh'

class OeChgrpActor(OeBaseActor):
    name = "OeChgrpActor"
    description = "Test the chgrp command of the openEuler system."
    sh_file = '01_files_directories/oe_test06_chgrp.sh'

class OeDdActor(OeBaseActor):
    name = "OeDdActor"
    description = "Test the dd command of the openEuler system."
    sh_file = '01_files_directories/oe_test07_dd.sh'

class OeFileActor(OeBaseActor):
    name = "OeFileActor"
    description = "Test the file command of the openEuler system."
    sh_file = '01_files_directories/oe_test08_file.sh'

class OeFindActor(OeBaseActor):
    name = "OeFindActor"
    description = "Test the find command of the openEuler system."
    sh_file = '01_files_directories/oe_test09_find.sh'

class OeLnActor(OeBaseActor):
    name = "OeLnActor"
    description = "Test the ln command of the openEuler system."
    sh_file = '01_files_directories/oe_test10_ln.sh'

class OeLsActor(OeBaseActor):
    name = "OeLsActor"
    description = "Test the ls command of the openEuler system."
    sh_file = '01_files_directories/oe_test11_ls.sh'

class OeMkdirActor(OeBaseActor):
    name = "OeMkdirActor"
    description = "Test the mkdir command of the openEuler system."
    sh_file = '01_files_directories/oe_test12_mkdir.sh'

class OeMvActor(OeBaseActor):
    name = "OeMvActor"
    description = "Test the mv command of the openEuler system."
    sh_file = '01_files_directories/oe_test13_mv.sh'

class OePwdActor(OeBaseActor):
    name = "OePwdActor"
    description = "Test the pwd command of the openEuler system."
    sh_file = '01_files_directories/oe_test14_pwd.sh'

class OeRenameActor(OeBaseActor):
    name = "OeRenameActor"
    description = "Test the rename command of the openEuler system."
    sh_file = '01_files_directories/oe_test15_rename.sh'

class OeRmActor(OeBaseActor):
    name = "OeRmActor"
    description = "Test the rm command of the openEuler system."
    sh_file = '01_files_directories/oe_test16_rm.sh'

class OeRmdirActor(OeBaseActor):
    name = "OeRmdirActor"
    description = "Test the rmdir command of the openEuler system."
    sh_file = '01_files_directories/oe_test17_rmdir.sh'

class OeTouchActor(OeBaseActor):
    name = "OeTouchActor"
    description = "Test the touch command of the openEuler system."
    sh_file = '01_files_directories/oe_test18_touch.sh'

class OeUpdatedbActor(OeBaseActor):
    name = "OeUpdatedbActor"
    description = "Test the updatedb command of the openEuler system."
    sh_file = '01_files_directories/oe_test19_updatedb.sh'

class OeWhereisActor(OeBaseActor):
    name = "OeWhereisActor"
    description = "Test the whereis command of the openEuler system."
    sh_file = '01_files_directories/oe_test20_whereis.sh'

class OeWhichActor(OeBaseActor):
    name = "OeWhichActor"
    description = "Test the which command of the openEuler system."
    sh_file = '01_files_directories/oe_test21_which.sh'

class OeCatActor(OeBaseActor):
    name = "OeCatActor"
    description = "Test the cat command of the openEuler system."
    sh_file = '01_files_directories/oe_test22_cat.sh'

class OeFindActor(OeBaseActor):
    name = "OeFindActor"
    description = "Test the cat command of the openEuler system."
    sh_file = '01_files_directories/oe_test23_find.sh'


class OeMkdirActor(OeBaseActor):
    name = "OeMkdirActor"
    description = "Test the mkdir command of the openEuler system."
    sh_file = '01_files_directories/oe_test24_mkdir.sh'


class OeNmActor(OeBaseActor):
    name = "OeNmActor"
    description = "Test the nm command of the openEuler system."
    sh_file = '01_files_directories/oe_test25_nm.sh'

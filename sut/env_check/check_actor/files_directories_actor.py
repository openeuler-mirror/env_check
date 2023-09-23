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


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

class OeChmodActor(OeBaseActor):
    name = "OeChmodActor"
    description = "Test the chmod command of the openEuler system."
    sh_file = '01_files_directories/'    
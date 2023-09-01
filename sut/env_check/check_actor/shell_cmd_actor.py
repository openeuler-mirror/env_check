# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeAliasActor(OeBaseActor):
    name = "OeAliasActor"
    description = "Test the alias command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_alias.sh'

class OeBindActor(OeBaseActor):
    name = "OeBgActor"
    description = "Test the bg command of the openEuler system."
    sh_file = '04_shellcmd_directories/oe_test04_bind.sh'

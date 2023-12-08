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

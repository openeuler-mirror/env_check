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

class OeLastActor(OeBaseActor):
    name = "OeLastActor"
    description = "Test the last command of the openEuler system."
    sh_file = '14_system_management/oe_test03_last.sh'

class OeLastbActor(OeBaseActor):
    name = "OeLastbActor"
    description = "Test the lastb command of the openEuler system."
    sh_file = '14_system_management/oe_test04_lastb.sh'

class OeRunlevelActor(OeBaseActor):
    name = "OeRunlevelActor"
    description = "Test the runlevel command of the openEuler system."
    sh_file = '14_system_management/oe_test05_runlevel.sh'

class OeRpmActor(OeBaseActor):
    name = "OeRpmActor"
    description = "Test the rpm command of the openEuler system."
    sh_file = '14_system_management/oe_test06_rpm.sh'

class OeYumActor(OeBaseActor):
    name = "OeYumActor"
    description = "Test the yum command of the openEuler system."
    sh_file = '14_system_management/oe_test07_yum.sh'

class OeAnacronActor(OeBaseActor):
    name = "OeAnacronActor"
    description = "Test the anacron command of the openEuler system."
    sh_file = '14_system_management/oe_test08_anacron.sh'
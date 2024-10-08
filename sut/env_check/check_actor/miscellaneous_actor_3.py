# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChronycActor(OeBaseActor):
    name = "OeChronycActor"
    description = "Test the chronyc command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test08_chronyc.sh'

class OeChvtActor(OeBaseActor):
    name = "OeChvtActor"
    description = "Test the chvt command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test14_chvt.sh'
    
class OeCmsutilActor(OeBaseActor):
    name = "OeCmsutilActor"
    description = "Test the cmsutil command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test20_cmsutil.sh'
    
# �� Python �У�����ͨ�����������ַ�����Ȼ�ⲻ���ϸ��ֹ�ģ������ܻᵼ��һЩ���������    
class OeCracklibcheckActor(OeBaseActor):
    name = "OeCracklib-checkActor"
    description = "Test the cracklib-check command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test26_cracklib-check.sh'
    
class OePython3Actor(OeBaseActor):
    name = "OePython3Actor"
    description = "Test the python3 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test33_python3.sh'

# -*- coding: utf-8 -*-
# Create: 2023-08-31
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeGpasswdActor(OeBaseActor):
    name = "OeGpasswdActor"
    description = "Test the gpasswd command of the openEuler system."
    sh_file = '07_user_management/oe_test01_gpasswd.sh'

class OeGroupaddActor(OeBaseActor):
    name = "OeGroupaddActor"
    description = "Test the groupadd command of the openEuler system."
    sh_file = '07_user_management/oe_test02_groupadd.sh'    

class OeGroupdelActor(OeBaseActor):
    name = "OeGroupdelActor"
    description = "Test the groupdel command of the openEuler system."
    sh_file = '07_user_management/oe_test03_groupdel.sh'

class OeGroupmodActor(OeBaseActor):
    name = "OeGroupmodActor"
    description = "Test the groupmod command of the openEuler system."
    sh_file = '07_user_management/oe_test04_groupmod.sh'

class OeGroupsActor(OeBaseActor):
    name = "OeGroupsActor"
    description = "Test the groups command of the openEuler system."
    sh_file = '07_user_management/oe_test05_groups.sh'

class OeGrpckActor(OeBaseActor):
    name = "OeGrpckActor"
    description = "Test the grpck command of the openEuler system."
    sh_file = '07_user_management/oe_test06_grpck.sh'

class OeGrpconvActor(OeBaseActor):
    name = "OeGrpconvActor"
    description = "Test the grpconv command of the openEuler system."
    sh_file = '07_user_management/oe_test07_grpconv.sh'

class OeGrpunconvActor(OeBaseActor):
    name = "OeGrpunconvActor"
    description = "Test the grpunconv command of the openEuler system."
    sh_file = '07_user_management/oe_test08_grpunconv.sh'

class OeLognameActor(OeBaseActor):
    name = "OeLognameActor"
    description = "Test the logname command of the openEuler system."
    sh_file = '07_user_management/oe_test09_logname.sh'

class OePasswdActor(OeBaseActor):
    name = "OePasswdActor"
    description = "Test the passwd command of the openEuler system."
    sh_file = '07_user_management/oe_test10_passwd.sh'

class OePwckActor(OeBaseActor):
    name = "OePwckActor"
    description = "Test the pwck command of the openEuler system."
    sh_file = '07_user_management/oe_test11_pwck.sh'

class OePwconvActor(OeBaseActor):
    name = "OePwconvActor"
    description = "Test the pwconv command of the openEuler system."
    sh_file = '07_user_management/oe_test12_pwconv.sh'

class OePwunconvActor(OeBaseActor):
    name = "OePwunconvActor"
    description = "Test the pwunconv command of the openEuler system."
    sh_file = '07_user_management/oe_test13_pwunconv.sh'

class OeSuActor(OeBaseActor):
    name = "OeSuActor"
    description = "Test the su command of the openEuler system."
    sh_file = '07_user_management/oe_test14_su.sh'

class OeUseraddActor(OeBaseActor):
    name = "OeUseraddActor"
    description = "Test the useradd command of the openEuler system."
    sh_file = '07_user_management/oe_test15_useradd.sh'

class OeUserdelActor(OeBaseActor):
    name = "OeUserdelActor"
    description = "Test the userdel command of the openEuler system."
    sh_file = '07_user_management/oe_test16_userdel.sh'

class OeUsermodActor(OeBaseActor):
    name = "OeUsermodActor"
    description = "Test the usermod command of the openEuler system."
    sh_file = '07_user_management/oe_test17_usermod.sh'

class OeUsersActor(OeBaseActor):
    name = "OeUsersActor"
    description = "Test the users command of the openEuler system."
    sh_file = '07_user_management/oe_test18_users.sh'

class OeChfnActor(OeBaseActor):
    name = "OeChfnActor"
    description = "Test the chfn command of the openEuler system."
    sh_file = '07_user_management/oe_test19_chfn.sh'

class OeChsnActor(OeBaseActor):
    name = "OeChsnActor"
    description = "Test the chsn command of the openEuler system."
    sh_file = '07_user_management/oe_test20_chsn.sh'

class OeFingerActor(OeBaseActor):
    name = "OeFingerActor"
    description = "Test the finger command of the openEuler system."
    sh_file = '07_user_management/oe_test21_finger.sh'

class OeAdduserActor(OeBaseActor):
    name = "OeAdduserActor"
    description = "Test the adduser command of the openEuler system."
    sh_file = '07_user_management/oe_test22_adduser.sh'
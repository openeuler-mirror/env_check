# -*- coding: utf-8 -*-
from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChattrActor(OeBaseActor):
    name = "OeChattrActor"
    description = "Test the chattr command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test01_chattr.sh'

class OeDfActor(OeBaseActor):
    name = "OeDfActor"
    description = "Test the df command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test02_df.sh'
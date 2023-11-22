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

class OeDumpe2fsActor(OeBaseActor):
    name = "OeDumpe2fsActor"
    description = "Test the dumpe2fs command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test03_dumpe2fs.sh'

class OeE2labelActor(OeBaseActor):
    name = "OeE2labelActor"
    description = "Test the e2label command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test04_e2label.sh'
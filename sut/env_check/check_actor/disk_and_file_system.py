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

class OeFdiskActor(OeBaseActor):
    name = "OeFdiskActor"
    description = "Test the fdisk command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test05_fdisk.sh'

class OeFindfsActor(OeBaseActor):
    name = "OeFindfsActor"
    description = "Test the findfs command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test06_findfs.sh'

class OeHdparmActor(OeBaseActor):
    name = "OeHdparmActor"
    description = "Test the hdparm command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test07_hdparm.sh'

class OeLsattrActor(OeBaseActor):
    name = "OeLsattrActor"
    description = "Test the lsattr command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test08_lsattr.sh'

class OeMke2fsActor(OeBaseActor):
    name = "OeMke2fsActor"
    description = "Test the mke2fs command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test09_mke2fs.sh'

class OeMkfsActor(OeBaseActor):
    name = "OeMke2fsActor"
    description = "Test the mkfs command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test10_mkfs.sh'
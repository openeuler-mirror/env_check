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

class OeMkinitrdActor(OeBaseActor):
    name = "OeMkinitrdActor"
    description = "Test the mkinitrd command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test11_mkinitrd.sh'

class OeMktempActor(OeBaseActor):
    name = "OeMktempActor"
    description = "Test the mktemp command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test12_mktemp.sh'

class OeMountActor(OeBaseActor):
    name = "OeMountActor"
    description = "Test the mount command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test13_mount.sh'

class OePartedActor(OeBaseActor):
    name = "OePartedActor"
    description = "Test the parted command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test14_parted.sh'

class OeTune2fsActor(OeBaseActor):
    name = "OeTune2fsActor"
    description = "Test the tune2fs command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test15_tune2fs.sh'

class OeAttrActor(OeBaseActor):
    name = "OeAttrActor"
    description = "Test the attr command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test16_attr.sh'
class OeLsblk1Actor(OeBaseActor):
    name = "OeLsblk1Actor"
    description = "Test the lsblk command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test17_lsblk01.sh,oe_test18_lsblk02.sh,oe_test19_lsblk03.sh，oe_test20_lsblk04.sh,oe_test21_lsblk05.sh'
class OeDos2unixActor(OeBaseActor):
    name = "OeDos2unixActor"
    description = "Test the dos2unix command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test22_dos2unix.sh'
class OeDosfsckActor(OeBaseActor):
    name = "OeDosfsckActor"
    description = "Test the tune2fs command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test23_dosfsck.sh'
class OeDosfslabelActor(OeBaseActor):
    name = "OeDosfslabelActor"
    description = "Test the dosfslabel command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test24_dosfslabel.sh'
class OeDracutActor(OeBaseActor):
    name = "OeDracutActor"
    description = "Test the dracut command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test25_dracut.sh'
class OeE2mmpstatusActor(OeBaseActor):
    name = "OeE2mmpstatusActor"
    description = "Test the e2mmpstatus command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test30_e2mmpstatus.sh'
class OeE2scrubActor(OeBaseActor):
    name = "OeE2scrubActor"
    description = "Test the e2scrub command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test31_e2scrub.sh'

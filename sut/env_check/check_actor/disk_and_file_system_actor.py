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
class OeDracut-catimagesActor(OeBaseActor):
    name = "OeDracut-catimagesActor"
    description = "Test the dracut command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test26_dracut-catimages.sh'
class OeDtraceActor(OeBaseActor):
    name = "OeDtraceActor"
    description = "Test the dtrace command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test27_dtrace.sh'
class OeCachecheckActor(OeBaseActor):
    name = "OeCachecheckActor"
    description = "Test the cachecheck command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test28_cachecheck.sh'
class OeCachedumpActor(OeBaseActor):
    name = "OeCachedumpActor"
    description = "Test the cachedump command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test29_cachedump.sh'
class OeE2mmpstatusActor(OeBaseActor):
    name = "OeE2mmpstatusActor"
    description = "Test the e2mmpstatus command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test30_e2mmpstatus.sh'
class OeE2scrubActor(OeBaseActor):
    name = "OeE2scrubActor"
    description = "Test the e2scrub command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test31_e2scrub.sh'
class OeE4cryptActor(OeBaseActor):
    name = "OeE4cryptActor"
    description = "Test the e4crypt command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test32_e4crypt.sh'
class OeE2undoActor(OeBaseActor):
    name = "OeE2undoActor"
    description = "Test the e2undo command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test33_e2undo.sh'
class OeCachematadatasizeActor(OeBaseActor):
    name = "OeCachematadatasizeActor"
    description = "Test the cachematadatasize command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test34_cachematadatasize.sh'
class OeCacherepairActor(OeBaseActor):
    name = "OeCacherepairActor"
    description = "Test the cacherepair command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test35_cacherepair.sh'
class OeCacherestoreActor(OeBaseActor):
    name = "OeCacherestoreActor"
    description = "Test the cacherestore command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test36_cache_restore.sh'
class OeCachewritebackActor(OeBaseActor):
    name = "OeCachewritebackActor"
    description = "Test the cache_writeback command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test37_cache_writeback.sh'
class OeSyncActor(OeBaseActor):
    name = "OeSyncActor"
    description = "Test the sync command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test36_sync.sh'
class OeCachematadatasizeActor(OeBaseActor):
    name = "OeCachematadatasizeActor"
    description = "Test the Cachematadatasize command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test39_cachematadatasize.sh'
class OeCacherepairActor(OeBaseActor):
    name = "OeCacherepairActor"
    description = "Test the cacherepair command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test40_cacherepair.sh'
class OeCacherestoreActor(OeBaseActor):
    name = "OeCacherestoreActor"
    description = "Test the cacherestore command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test41_cache_restore.sh'
class OeCachewritebackActor(OeBaseActor):
    name = "OeCachewritebackActor"
    description = "Test the cachewriteback command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test42_cache_writeback'
class OeFccacheActor(OeBaseActor):
    name = "OeFccacheActor"
    description = "Test the fc-cache command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test43_fc-cache.sh'
class OeUnlinkActor(OeBaseActor):
    name = "OeUnlinkActor"
    description = "Test the unlink command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test44_unlink.sh'    
class OeGtkupdateiconcacheActor(OeBaseActor):
    name = "OeGtkupdateiconcacheActor"
    description = "Test the gtk-update-icon-cache command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test45_gtk-update-icon-cache.sh'
class OeNllistCachesActor(OeBaseActor):
    name = "OeNllistCachesActor"
    description = "Test the nl-list-caches command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test46_nl-list-caches.sh'
class OeFccache64Actor(OeBaseActor):
    name = "OeFccache64Actor"
    description = "Test the fc-cache-64 command of the openEuler system."
    sh_file = '09_disk_and_file_system/oe_test47_fc-cache-64.sh'



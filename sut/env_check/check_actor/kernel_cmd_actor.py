from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeDmesgActor(OeBaseActor):
    name = "OeDmesgActor"
    description = "Test the dmesg command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test01_dmesg.sh'
class OeFreeActor(OeBaseActor):
    name = "OeFreeActor"
    description = "Test the free command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test02_free.sh'
class OeIostatActor(OeBaseActor):
    name = "OeIostatActor"
    description = "Test the iostat command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test03_iostat.sh'
class OeIpcsActor(OeBaseActor):
    name = "OeIpcsActor"
    description = "Test the ipcs command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test04_ipcs.sh'
class OeModinfoActor(OeBaseActor):
    name = "OeModinfoActor"
    description = "Test the modinfo command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test05_modinfo.sh'
class OeLsmodActor(OeBaseActor):
    name = "OeLsmodActor"
    description = "Test the lsmod command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test06_lsmod.sh'
class OeModprobeActor(OeBaseActor):
    name = "OeModprobeActor"
    description = "Test the modprobe command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test07_modprobe.sh'
class OeMpstatActor(OeBaseActor):
    name = "OeMpstatActor"
    description = "Test the mpstat command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test08_mpstat.sh'
class OeSarActor(OeBaseActor):
    name = "OeSarActor"
    description = "Test the sar command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test09_sar.sh'	
class OeSlabtopActor(OeBaseActor):
    name = "OeSlabtopActor"
    description = "Test the slabtop command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test10_slabtop.sh'
class OeSlabtopActor(OeBaseActor):
    name = "OeSlabtopActor"
    description = "Test the slabtop command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test11_slabtop.sh'
class OeVmstatActor(OeBaseActor):
    name = "OeVmstatActor"
    description = "Test the vmsta command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test12_vmstat.sh'
class OeUnameActor(OeBaseActor):
    name = "OeUnameActor"
    description = "Test the uname command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test13_uname.sh'
class OeSlabtopActor(OeBaseActor):
    name = "OeSlabtopActor"
    description = "Test the uptime command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test14_uptime.sh'
class OeCapshActor(OeBaseActor):
    name = "OeCapshActor"
    description = "Test the capsh command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test15_capsh.sh'
class OeCaptestActor(OeBaseActor):
    name = "OeCaptestActor"
    description = "Test the captest command of the openEuler system."
    sh_file = '10_kernelcmd_directories/oe_test16_captest.sh'
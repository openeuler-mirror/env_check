# -*- coding: utf-8 -*-
# Create: 2023-12-18
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeChrootActor(OeBaseActor):
    name = "OeChrootActor"
    description = "Test the chroot command of the openEuler system."
    sh_file = '12_system_safety/oe_test01_chroot.sh'
    
class OeNmapActor(OeBaseActor):
    name = "OeNmapActor"
    description = "Test the nmap command of the openEuler system."
    sh_file = '12_system_safety/oe_test02_nmap.sh'
    
class OeScpActor(OeBaseActor):
    name = "OeScpActor"
    description = "Test the scp command of the openEuler system."
    sh_file = '12_system_safety/oe_test03_scp.sh'
    
class OeSftpActor(OeBaseActor):
    name = "OeSftpActor"
    description = "Test the sftp command of the openEuler system."
    sh_file = '12_system_safety/oe_test04_sftp.sh'
    
class OeSloginActor(OeBaseActor):
    name = "OeSloginActor"
    description = "Test the slogin command of the openEuler system."
    sh_file = '12_system_safety/oe_test05_slogin.sh'
    
class OeSshActor(OeBaseActor):
    name = "OeSshActor"
    description = "Test the ssh command of the openEuler system."
    sh_file = '12_system_safety/oe_test06_ssh.sh'

class OeSudoActor(OeBaseActor):
    name = "OeSudoActor"
    description = "Test the sudo command of the openEuler system."
    sh_file = '12_system_safety/oe_test07_sudo.sh'
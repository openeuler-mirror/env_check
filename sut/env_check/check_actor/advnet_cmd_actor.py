from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeAbActor(OeBaseActor):
    name = "OeAbActor"
    description = "Test the ab command of the openEuler system."
    sh_file = '18_netservcmd_directories/oe_test01_ab.sh'	
class OeApachectlActor(OeBaseActor):
    name = "OeApachectlActor"
    description = "Test the apachectl command of the openEuler system."
    sh_file = '18_netservcmd_directories/oe_test02_apachectl.sh'
class OeExportfsActor(OeBaseActor):
    name = "OeExportfsActor"
    description = "Test the exportfs command of the openEuler system."
    sh_file = '18_netservcmd_directories/oe_test03_exportfs.sh'
class OeHttpdActor(OeBaseActor):
    name = "OeHttpdActor"
    description = "Test the httpd command of the openEuler system."
    sh_file = '18_netservcmd_directories/oe_test04_httpd.sh'	
class OeSshdActor(OeBaseActor):
    name = "OeSshdActor"
    description = "Test the sshd command of the openEuler system."
    sh_file = '18_netservcmd_directories/oe_test05_sshd.sh'	

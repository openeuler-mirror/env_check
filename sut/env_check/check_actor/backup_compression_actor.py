# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeBzip2Actor(OeBaseActor):
    name = "OeBzip2Actor"
    description = "Test the bzip2 command of the openEuler system."
    sh_file = '02_backup_compression/oe_test01_bzip2.sh'

class OeCpioActor(OeBaseActor):
    name = "OeCpioActor"
    description = "Test the cpio command of the openEuler system."
    sh_file = '02_backup_compression/oe_test02_cpio.sh'

class OeGzipActor(OeBaseActor):
    name = "OeGzipActor"
    description = "Test the Gzip command of the openEuler system."
    sh_file = '02_backup_compression/oe_test03_gzip.sh'

class OeTarActor(OeBaseActor):
    name = "OeTarActor"
    description = "Test the Tar command of the openEuler system."
    sh_file = '02_backup_compression/oe_test04_tar.sh'

class OeZipActor(OeBaseActor):
    name = "OeZipActor"
    description = "Test the Zip command of the openEuler system."
    sh_file = '02_backup_compression/oe_test05_zip.sh'

class OeZipinfoActor(OeBaseActor):
    name = "OeZipinfoActor"
    description = "Test the Zipinfo command of the openEuler system."
    sh_file = '02_backup_compression/oe_test06_zipinfo.sh'

class OeZcatActor(OeBaseActor):
    name = "OeZcatActor"
    description = "Test the Zcat command of the openEuler system."
    sh_file = '02_backup_compression/oe_test07_zcat.sh'

class OeZforceActor(OeBaseActor):
    name = "OeZforceActor"
    description = "Test the Zforce command of the openEuler system."
    sh_file = '02_backup_compression/oe_test08_zforce.sh'

class OeUnzipActor(OeBaseActor):
    name = "OeUnzipActor"
    description = "Test the Unzip command of the openEuler system."
    sh_file = '02_backup_compression/oe_test09_unzip.sh'

class OeGunzipActor(OeBaseActor):
    name = "OeGunzipActor"
    description = "Test the Gunzip command of the openEuler system."
    sh_file = '02_backup_compression/oe_test10_gunzip.sh'

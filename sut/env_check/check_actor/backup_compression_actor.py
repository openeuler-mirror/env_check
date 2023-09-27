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

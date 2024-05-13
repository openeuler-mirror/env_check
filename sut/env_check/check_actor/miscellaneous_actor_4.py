# -*- coding: utf-8 -*-

from sut.env_check.check_actor.oe_base_actor import OeBaseActor

class OeChronydActor(OeBaseActor):
    name = "OeChronydActor"
    description = "Test the chronyd command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test09_chronyd.sh'

class OeCifsiostatActor(OeBaseActor):
    name = "OeCifsiostatActor"
    description = "Test the cifsiostat command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test15_cifsiostat.sh'
    
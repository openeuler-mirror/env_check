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
    
class OeCorelistActor(OeBaseActor):
    name = "OeCorelistActor"
    description = "Test the corelist command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test21_corelist.sh'
    
class OeCracklibformatActor(OeBaseActor):
    name = "OeCracklib-formatActor"
    description = "Test the cracklib-format command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test27_cracklib-format.sh'




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

class OeCorelistActor(OeBaseActor):
    name = "OeCorelistActor"
    description = "Test the corelist command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test21_corelist.sh'
    
class OePython27Actor(OeBaseActor):
    name = "OePython27Actor"
    description = "Test the python2.7 command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test34_python2.7.sh'

class OePython27debugconfigActor(OeBaseActor):
    name = "OePython27debugconfigActor"
    description = "Test the python2.7-debug-config command of the openEuler system."
    sh_file = '99_miscellaneous/oe_test40_python2.7-debug-config.sh'
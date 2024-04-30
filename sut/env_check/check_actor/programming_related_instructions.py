# -*- coding: utf-8 -*-
# Create: 2023-12-19
# Author: zengyifeng

from sut.env_check.check_actor.oe_base_actor import OeBaseActor
    
class OeAwkActor(OeBaseActor):
    name = "OeAwkActor"
    description = "Test the awk command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test01_awk.sh'
    
class OeGawkActor(OeBaseActor):
    name = "OeGawkActor"
    description = "Test the gawk command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test02_gawk.sh'

class OeExprActor(OeBaseActor):
    name = "OeExprActor"
    description = "Test the expr command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test03_expr.sh'

class OeAddr2lineActor(OeBaseActor):
    name = "OeAddr2lineActor"
    description = "Test the addr2line command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test04_addr2line.sh'

class OeYumActor(OeBaseActor):
    name = "OeYumActor"
    description = "Test the yum command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test05_yum.sh'

class OeAsn1CodingActor(OeBaseActor):
    name = "OeAsn1CodingActor"
    description = "Test the asn1Coding command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test06_asn1Coding.sh'

class OeAsn1DecodingActor(OeBaseActor):
    name = "OeAsn1DecodingActor"
    description = "Test the asn1Decoding command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test07_asn1Decoding.sh'

class OeAsn1ParserActor(OeBaseActor):
    name = "OeAsn1ParserActor"
    description = "Test the asn1Parser command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test08_asn1Parser.sh'

class OeGccActor(OeBaseActor):
    name = "OeGccActor"
    description = "Test the gcc command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test09_gcc.sh'
class OeYumconfigmanagerActor(OeBaseActor):
    name = "OeYumconfigmanagerActor"
    description = "Test the yum-config-manager command of the openEuler system."
    sh_file = '13_programming_related_instructions/oe_test10_yum-config-manager.sh'

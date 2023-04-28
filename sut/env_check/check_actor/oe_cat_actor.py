# -*- coding: utf-8 -*-

"""
Copyright: Copyright © Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
"""
from sut.env_check.check_actor.oe_base_actor import OeBaseActor


class OeCatActor(OeBaseActor):
    name = "OeCatActor"
    description = "Test the cat command of the openEuler system."
    sh_file = 'oe_test_cat_001.sh'


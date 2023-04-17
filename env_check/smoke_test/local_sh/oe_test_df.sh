#!/usr/bin/bash

# Copyright: Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
# Create: 2023-02-09
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../common/common_lib.sh"
# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    df | grep '/boot'
    CHECK_RESULT $? 0 0 "df display error"
    df | grep 'G'
    CHECK_RESULT $? 1 0 "df default display error"
    df -h | grep -E 'G|M|K'
    CHECK_RESULT $? 0 0 "df -h didn't find G|M|K"
    df --help
    CHECK_RESULT $? 0 0 "df --help error"
    LOG_INFO "Finish test!"
}

main $@

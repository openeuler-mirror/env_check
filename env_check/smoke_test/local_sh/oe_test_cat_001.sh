#!/usr/bin/bash
# Copyright: Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
# Create: 2023-02-09

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../common/common_lib.sh"
# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End to prepare the test environment."
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    cat /etc/passwd | grep "root:x:0:0:root:/root:/bin/bash"
    CHECK_RESULT $?
    cat -n /etc/passwd | grep "root:x:0:0:root:/root:/bin/bash" | awk -F ' ' '{print $1}' | grep 1
    CHECK_RESULT $?
    cat --help | grep -E "Usage|用法"
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
main $@

#!/usr/bin/bash
# Create: 2024-05-14 16:21:16
# Auther: hebinxin
# Description: A shellscript to check bashbug command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

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

    # 1. test bashbug --help
    bashbug --help
    CHECK_RESULT $? 0 0 "bashbug --help error"

    # 2. test bashbug --version
    test bashbug --help
    CHECK_RESULT $? 0 0 "bashbug --version error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
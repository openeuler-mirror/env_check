#!/usr/bin/bash
# Create: 2024-03-07 14:01:24
# Auther: hebinxin
# Description: A shellscript to check ping command.

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

    # 1. test ping -c
    ping -c 3 127.0.0.1 | grep -E "3 packets"
    CHECK_RESULT $? 0 0 "ping -c error"

    # 2. test ping -R
    ping -c 4 127.0.0.1 -R | grep -E "RR"
    CHECK_RESULT $? 0 0 "ping -R error"

    # 3.test ping -V
    ping -V
    CHECK_RESULT $? 0 0 "ping -V error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
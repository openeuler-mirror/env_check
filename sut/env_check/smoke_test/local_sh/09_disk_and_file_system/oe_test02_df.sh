#!/usr/bin/bash
# Create: 2023-11-15 13:52:02
# Auther: hebinxin
# Description: A shellscript to check df command.

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

    # 1. test df
    df | grep "/boot"
    CHECK_RESULT $? 0 0 "df display error"

    # 2. test df -h
    df -h | grep -E "G|M|K"
    CHECK_RESULT $? 0 0 "df -h display error"

    # 3. test df --help
    df --help
    CHECK_RESULT $? 0 0 "df --help error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@


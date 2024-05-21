#!/usr/bin/bash
# Create: 2024-05-21 10:05:18
# Auther: hebinxin
# Description: A shellscript to check biosdecode command.

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

    # 1. test biosdecode --help
    biosdecode --help
    CHECK_RESULT $? 0 0 "biosdecode --help error"

    # 2. test biosdecode --version
    biosdecode --version
    CHECK_RESULT $? 0 0 "biosdecode --version error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
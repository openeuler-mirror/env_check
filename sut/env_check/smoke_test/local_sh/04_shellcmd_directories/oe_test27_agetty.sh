#!/usr/bin/bash
# Create: 2024-04-18 19:34:06
# Auther: hebinxin
# Description: A shellscript to check agetty command.

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

    ### agetty is a commandline tool of starting and managing virtual terminal in linux system ###

    # 1. test agetty -version
    agetty --version
    CHECK_RESULT $? 0 0 "agetty --version error"

    # 2. test agetty --help
    agetty --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "agetty --help error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
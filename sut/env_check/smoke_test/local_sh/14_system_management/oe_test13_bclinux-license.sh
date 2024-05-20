#!/usr/bin/bash
# Create: 2024-05-20 12:06:47
# Auther: hebinxin
# Description: A shellscript to check bclinux-license command.
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

    # 1. test bclinux-license -h
    bclinux-license -h
    CHECK_RESULT $? 0 0 "bclinux-license -h error"

    # 2. test bclinux-license -s
    bclinux-license -s
    CHECK_RESULT $? 0 0 "bclinux-license -s error"

    # 3. test bclinux-license -g
    bclinux-license -g
    CHECK_RESULT $? 0 0 "bclinux-license -g error"
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
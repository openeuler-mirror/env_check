#!/usr/bin/bash
# Create: 2024-01-08 10:11:03
# Auther: hebinxin
# Description: A shellscript to check tune2fs command.

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

    fs = $(df -h | grep "/boot" | awk -F ' ' '{print $1}' )
    tune2fs -l $fs
    CHECK_RESULT $? 0 0  "tune2fs -l error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@


#!/bin/bash

# Create: 2024-8-27
# Author: gaoyanjun
# Description: Test script for flock command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 在这里添加需要的环境准备步骤
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    flock -V
    CHECK_RESULT $?

    flock -h
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@


#!/bin/bash

# Create: 2024-3-14
# Author: dongchao
# Description: Test script for vmstat command.

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
    
    vmstat -a
    CHECK_RESULT $?

    vmstat -f 
    CHECK_RESULT $?

    vmstat -m
    CHECK_RESULT $?
    
    vmstat -n
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

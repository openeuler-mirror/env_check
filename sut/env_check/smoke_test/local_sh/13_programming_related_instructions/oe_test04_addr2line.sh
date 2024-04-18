#!/bin/bash

# Create: 2024-3-29
# Author: zengyifeng
# Description: Test script for the expr command.

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
    
    # 检查 expr 命令是否存在
    if ! command -v addr2line &>/dev/null; then
        LOG_WARN "addr2line command is not installed"
        CHECK_RESULT $? 0 0 "addr2line command is not installed"
        return
    fi
    
    addr2line --help |grep -E "addr2line"
    CHECK_RESULT $? 0 0
    
    addr2line --version
    CHECK_RESULT $? 0 0
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@


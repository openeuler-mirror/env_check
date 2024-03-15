#!/bin/bash

# Create: 2023-12-18
# Author: zengyifeng
# Description: Test script for sudo command.

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

    # 测试 sudo 命令
    sudo -h
    CHECK_RESULT $? 0 0 "Failed to execute 'sudo -h'."

    sudo -V
    CHECK_RESULT $? 0 0 "Failed to execute 'sudo -V'."

    # 执行 sudo -l，不应该有密码提示
    sudo -n -l
    CHECK_RESULT $? 0 0 "Failed to execute 'sudo -l'."

    # 执行 sudo -l，不应该有密码提示
    sudo -l
    CHECK_RESULT $? 0 0 "Failed to execute 'sudo -l'."


    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@

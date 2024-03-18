#!/bin/bash

# Create: 2024-3-1
# Author: zengyifeng
# Description: Test script for local SSH command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 可以在这里添加需要的环境准备步骤
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 测试ssh命令
    #ssh | grep -E "usage|用法"
    #CHECK_RESULT $? 0 0 "Failed to execute 'ssh'."
    # 不行！ 输入 ssh 后回车本身 $? 就是1
    
    '''
    # 执行本地的 SSH 命令，使用密钥认证
    ssh_result=$(ssh -o PasswordAuthentication=no localhost ls)

    # 检查 SSH 命令执行结果是否包含预期的内容
    expected_content="ssh"

    echo "$ssh_result" | grep "$expected_content"
    CHECK_RESULT $? 0 0 "Failed to execute or verify SSH command."
    '''
    
    ssh -V
    CHECK_RESULT $? 0 0 "Failed to execute or verify SSH command."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 可以在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@

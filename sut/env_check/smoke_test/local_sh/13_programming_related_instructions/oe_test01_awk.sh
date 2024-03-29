#!/bin/bash

# Create: 2024-3-27
# Author: zengyifeng
# Description: Test script for awk command.

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

    # 使用 awk 命令进行简单的文本处理
    
    # text=" 这里=以后不能换行！
    
    text="
    apple 5
    banana 10
    cherry 15
    "

    # 使用 awk 提取第二列的和
    sum=$(echo "$text" | awk '{ sum += $2 } END { print sum }')

    # 验证结果是否符合预期
    expected_sum=30
    CHECK_RESULT $sum $expected_sum 0 "Failed to calculate the sum using awk."
    
    # 测试 awk 命令，处理文件并输出结果
    awk_result=$(awk -F':' '{print "Username: " $1, "UID: " $3}' /etc/passwd)

    # 验证 awk 命令的输出是否包含预期的内容
    expected_content="root"
    echo "$awk_result" | grep "$expected_content"
    CHECK_RESULT $? 0 0 "Failed to execute or verify awk command."
    
    
    # 测试awk命令的--version参数
    awk --version
    CHECK_RESULT $? 0 0 "Failed to execute 'awk --version'."
    
    awk --copyright
    CHECK_RESULT $? 0 0 "Failed to execute 'awk --copyright'."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@

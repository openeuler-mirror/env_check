#!/bin/bash

# Create: 2024-3-27
# Author: zengyifeng
# Description: Test script for gawk command.

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
    
    # 检查 gawk 命令是否存在
    if ! command -v gawk &>/dev/null; then
        LOG_WARN "gawk command is not installed"
        CHECK_RESULT $? 0 0 "gawk command is not installed"
        return
    fi

    # 使用 gawk 命令进行简单的文本处理
    
    # text=" 这里=以后不能换行！
    
    text="
    apple 5
    banana 10
    cherry 15
    "

    # 使用 awk 提取第二列的和
    sum=$(echo "$text" | gawk '{ sum += $2 } END { print sum }')

    # 验证结果是否符合预期
    expected_sum=30
    CHECK_RESULT $sum $expected_sum 0 "Failed to calculate the sum using gawk."
    
    # 测试 awk 命令，处理文件并输出结果
    gawk_result=$(gawk -F':' '{print "Username: " $1, "UID: " $3}' /etc/passwd)

    # 验证 awk 命令的输出是否包含预期的内容
    expected_content="root"
    echo "$gawk_result" | grep "$expected_content"
    CHECK_RESULT $? 0 0 "Failed to execute or verify gawk command."
    
    
    # 测试gawk命令的--version参数
    gawk --version
    CHECK_RESULT $? 0 0 "Failed to execute 'gawk --version'."
    
    gawk --copyright
    CHECK_RESULT $? 0 0 "Failed to execute 'gawk --copyright'."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@

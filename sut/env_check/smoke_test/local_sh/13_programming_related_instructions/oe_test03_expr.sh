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
    if ! command -v expr &>/dev/null; then
        LOG_WARN "expr command is not installed"
        CHECK_RESULT $? 0 0 "expr command is not installed"
        return
    fi
    
    expr --help |grep -E "expr"
    CHECK_RESULT $? 0 0
    
    expr --version
    CHECK_RESULT $? 0 0
    

    # 使用 expr 进行简单的算术运算
    result=$(expr 5 + 3)

    # 验证结果是否符合预期
    expected_result=8
    CHECK_RESULT $result $expected_result 0 "Failed to perform arithmetic operation using expr."
    
    # 使用 expr 进行字符串匹配
    string="Hello, World!"
    pattern="World"
    match=$(expr "$string" : ".*$pattern")

    # 验证匹配结果是否符合预期
    expected_match=12
    CHECK_RESULT $match $expected_match 0 "Failed to match pattern using expr."
    
    # 使用 expr 进行字符串长度计算
    length=$(expr length "$string")

    # 验证字符串长度是否符合预期
    expected_length=13
    CHECK_RESULT $length $expected_length 0 "Failed to calculate string length using expr."
    
    # 使用 expr 进行字符串提取
    substring=$(expr substr "$string" 8 5)

    # 验证提取结果是否符合预期
    expected_substring="World"
    CHECK_RESULT "$substring" "$expected_substring" 0 "Failed to extract substring using expr."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    LOG_INFO "End to restore the test environment."
}

main $@


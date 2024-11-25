#!/usr/bin/bash
# Create: 2024-11-13 
# Auther: wuhuitao
# Description: A shellscript to check echo command.

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
    
    # 测试 echo 基本功能
    echo "Hello, World!" > echo_output.txt
    CHECK_RESULT $? 0 0 "echo basic functionality error"
    CHECK_FILE_CONTENT "Hello, World!" "echo_output.txt" "echo output matches expected result"

    # 测试 echo 与变量
    local_var="Test Variable"
    echo "Local variable: $local_var" > echo_output.txt
    CHECK_RESULT $? 0 0 "echo with variable error"
    CHECK_FILE_CONTENT "Local variable: $local_var" "echo_output.txt" "echo output with variable matches expected result"

    # 测试 echo 的 -n 选项
    echo -n "No newline" > echo_output.txt
    CHECK_RESULT $? 0 0 "echo -n error"
    CHECK_FILE_CONTENT "No newline" "echo_output.txt" "echo -n output matches expected result"

    rm -f echo_output.txt

    LOG_INFO "Finish test!"
}
# 检查文件内容是否符合预期
function CHECK_FILE_CONTENT() {
    local expected="$1"
    local filename="$2"
    local message="$3"
    if [ "$(cat "$filename")" == "$expected" ]; then
        LOG_INFO "PASS - $message"
    else
        LOG_INFO "FAIL - $message"
        exit 1
    fi
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main$@

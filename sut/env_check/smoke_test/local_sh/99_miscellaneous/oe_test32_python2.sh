#!/usr/bin/bash

# Describe: This script tests the functionality of the python2 command.

# Create: 2023-11-01
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 获取脚本所在路径
OET_PATH=$( 
    cd "$(dirname "$0")" || exit 1 
    pwd 
)

# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"


# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个简单的 python2 测试脚本，并添加编码声明
    test_py_script="/tmp/test_py_script_${current_date_time}.py"
    cat > "$test_py_script" << EOF
# -*- coding: utf-8 -*-
# 一个简单的 python2 脚本，打印 Hello, World!
print("Hello, World!")
EOF
    LOG_INFO "python2 test script has been created at $test_py_script"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing python2 command..."

    # 检查 python2 命令是否存在
    if ! command -v python2 &>/dev/null; then
        LOG_ERROR "python2 command is not installed."
        CHECK_RESULT 1 0 0 "python2 is required for this test."
        return
    fi

    # 检查 python2 版本
    LOG_INFO "Checking python2 version..."
    python2 --version
    CHECK_RESULT $? 0 0 "Failed to execute 'python2 --version'."

    # 检查 python2 测试脚本文件是否存在和权限
    LOG_INFO "Checking if the python2 test script exists and has the correct permissions..."
    script_path="/tmp/test_py_script_${current_date_time}.py"
    if [ -f "$script_path" ]; then
        ls -l "$script_path"
        if [ ! -x "$script_path" ]; then
            LOG_WARN "python2 script is not executable. Adding execute permissions."
            chmod +x "$script_path"
        fi
    else
        LOG_ERROR "python2 test script does not exist at path: $script_path"
        CHECK_RESULT 1 0 0 "python2 test script not found."
        return
    fi

    # 执行 python2 测试脚本
    LOG_INFO "Executing the python2 test script..."
    test_py_output="/tmp/test_py_output_${current_date_time}.txt"
    python2 "$script_path" > "$test_py_output"
    CHECK_RESULT $? 0 0 "Failed to execute python2 script."

    # 验证 python2 脚本输出
    if grep -q "Hello, World!" "$test_py_output"; then
        LOG_INFO "python2 script executed successfully and output is correct."
    else
        LOG_ERROR "python2 script did not produce the expected output."
        CHECK_RESULT 1 0 0 "python2 script output verification failed."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    test_py_script="/tmp/test_py_script_${current_date_time}.py"
    test_py_output="/tmp/test_py_output_${current_date_time}.txt"
    rm -f "$test_py_script" "$test_py_output"
    LOG_INFO "End to restore the test environment."
}


# 调用主入口函数
main "$@"
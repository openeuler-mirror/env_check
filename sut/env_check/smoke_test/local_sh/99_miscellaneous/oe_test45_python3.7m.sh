#!/usr/bin/bash

# Describe: This script tests the functionality of the python3.7m command.

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
    # 创建一个简单的 Python 测试脚本
    test_py_script="/tmp/test_py_script_${current_date_time}.py"
    cat > "$test_py_script" << EOF
# 一个简单的 Python 脚本，打印 Hello, World!
print("Hello, World!")
EOF
    LOG_INFO "Python test script has been created at $test_py_script"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing python3.7m command..."

    # 检查 python3.7m 命令是否存在
    if ! command -v python3.7m &>/dev/null; then
        LOG_ERROR "python3.7m command is not installed."
        CHECK_RESULT 1 0 0 "python3.7m is required for this test."
        return
    fi

    # 检查 python3.7m 版本
    LOG_INFO "Checking python3.7m version..."
    python3.7m --version
    CHECK_RESULT $? 0 0 "Failed to execute 'python3.7m --version'."

    # 执行 Python 测试脚本
    LOG_INFO "Executing the Python test script with python3.7m..."
    test_py_output="/tmp/test_py_output_${current_date_time}.txt"
    python3.7m "$test_py_script" > "$test_py_output"
    CHECK_RESULT $? 0 0 "Failed to execute Python script with python3.7m."

    # 验证 Python 脚本输出
    if grep -q "Hello, World!" "$test_py_output"; then
        LOG_INFO "Python script executed successfully and output is correct."
    else
        LOG_ERROR "Python script did not produce the expected output."
        CHECK_RESULT 1 0 0 "Python script output verification failed."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    rm -f "$test_py_script" "$test_py_output"
    LOG_INFO "End to restore the test environment."
}

# 调用主入口函数
main "$@"
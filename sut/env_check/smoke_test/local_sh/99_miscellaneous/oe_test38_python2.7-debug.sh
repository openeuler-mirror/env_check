#!/usr/bin/bash

# Describe: This script tests the functionality of the python2.7-debug command.

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
    # 创建一个简单的 Python 测试脚本用于调试
    test_py_script="/tmp/test_py_script_${current_date_time}.py"
    cat > "$test_py_script" << EOF
def test_function():
    print("Hello, World!")
    return 42

test_function()
EOF
    LOG_INFO "Python test script has been created at $test_py_script"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing python2.7-debug command..."

    # 检查 python2.7-debug 命令是否存在
    if ! command -v python2.7-debug &>/dev/null; then
        LOG_ERROR "python2.7-debug command is not installed."
        CHECK_RESULT 1 0 0 "python2.7-debug is required for this test."
        return
    fi

    # 检查 python2.7-debug 版本
    LOG_INFO "Checking python2.7-debug version..."
    python2.7-debug --version
    CHECK_RESULT $? 0 0 "Failed to execute 'python2.7-debug --version'."

    # 执行 Python 测试脚本并使用调试器
    LOG_INFO "Running the Python test script with python2.7-debug..."
    python2.7-debug "$test_py_script"
    CHECK_RESULT $? 0 0 "Failed to run Python script with python2.7-debug."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    rm -f "/tmp/test_py_script_${current_date_time}.py"
    LOG_INFO "End to restore the test environment."
}

# 调用主入口函数
main "$@"
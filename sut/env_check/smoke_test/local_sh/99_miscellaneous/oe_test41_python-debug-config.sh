#!/usr/bin/bash

# Describe: This script tests the functionality of the python-debug-config command.

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
    # 此处可以添加测试环境的准备步骤，如果需要
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing python-debug-config command..."

    # 检查 python-debug-config 命令是否存在
    if ! command -v python-debug-config &>/dev/null; then
        LOG_ERROR "python-debug-config command is not installed."
        CHECK_RESULT 1 0 0 "python-debug-config is required for this test."
        return
    fi

    # 检查 python-debug-config --help
    LOG_INFO "Checking python-debug-config --help..."
    python-debug-config --help
    CHECK_RESULT $? 0 0 "Failed to execute 'python-debug-config --help'."

    # 获取配置信息
    LOG_INFO "Getting configuration information from python-debug-config..."
    includes=$(python-debug-config --includes)
    libs=$(python-debug-config --libs)
    prefix=$(python-debug-config --prefix)

    LOG_INFO "Includes: $includes"
    LOG_INFO "Libs: $libs"
    LOG_INFO "Prefix: $prefix"

    # 检查输出是否符合预期
    CHECK_RESULT $? 0 0 "Failed to get configuration information with python-debug-config."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 此处可以添加测试环境的清理步骤，如果需要
    LOG_INFO "End to restore the test environment."
}

# 调用主入口函数
main "$@"
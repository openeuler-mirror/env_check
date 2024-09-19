#!/usr/bin/bash

# Describe: This script tests the functionality of the python2.7-config command.

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
    LOG_INFO "Start testing python2.7-config command..."

    # 检查 python2.7-config 命令是否存在
    if ! command -v python2.7-config &>/dev/null; then
        LOG_ERROR "python2.7-config command is not installed."
        CHECK_RESULT 1 0 0 "python2.7-config is required for this test."
        return
    fi

    # 检查 python2.7-config --help
    LOG_INFO "Checking python2.7-config --help..."
    #python2.7-config --help | grep -Ei 'Usage|用法' 不行
    python2.7-config --help
    CHECK_RESULT $? 0 0 "Failed to execute 'python2.7-config --help'."

    # 执行一些 python2.7-config 命令来测试其功能
    LOG_INFO "Testing python2.7-config options..."
    # 例如，获取 include 目录
    include_dir=$(python2.7-config --includes)
    LOG_INFO "Include directories for Python 2.7 extensions: $include_dir"
    CHECK_RESULT $? 0 0 "Failed to get include directories with python2.7-config."

    # 可以添加更多的测试用例，例如 --libs, --prefix 等选项的测试

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
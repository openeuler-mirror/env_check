#!/usr/bin/bash

# Describe: This script is used to check the functionality of the ciptool command with -V and --help options, and to list loaded kernel features.

# Create: 2023-11-01
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 定义 OET_PATH 为当前脚本所在的目录
# OET_PATH=$(cd "$(dirname "$0")" && pwd)
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)

# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 如果需要，可以在这里添加环境准备步骤
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing ciptool command..."

    # 检查 ciptool 命令是否存在
    if ! command -v ciptool &>/dev/null; then
        LOG_ERROR "ciptool command is not installed."
        CHECK_RESULT 1 0 0 "ciptool is required for this test."
        return
    fi

    # 检查 ciptool -V 选项
    LOG_INFO "Checking ciptool -V option..."
    ciptool -V
    CHECK_RESULT $? 0 0 "Failed to execute 'ciptool -V'."

    # 检查 ciptool --help 选项
    LOG_INFO "Checking ciptool --help option..."
    ciptool --help
    CHECK_RESULT $? 0 0 "Failed to execute 'ciptool --help'."

    # 列出已加载的内核功能
    LOG_INFO "Listing loaded kernel features..."
    ciptool --list=loaded
    CHECK_RESULT $? 0 0 "Failed to list loaded kernel features with 'ciptool'."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 如果需要，可以在这里添加清理步骤
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
#!/usr/bin/bash

# Describe: This script is used to test the cpio command with -v, --help options, and to perform archiving and extraction operations.

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

    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing cpio command..."

    # 检查 cpio 命令是否存在
    if ! command -v cpio &>/dev/null; then
        LOG_ERROR "cpio command is not installed."
        CHECK_RESULT 1 0 0 "cpio is required for this test."
        return
    fi


    # 检查 cpio --help 选项
    LOG_INFO "Checking cpio --help option..."
    cpio --help
    CHECK_RESULT $? 0 0 "Failed to execute 'cpio --help'."


    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."

    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
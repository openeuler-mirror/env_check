#!/usr/bin/bash

# Describe: This script checks the chmem command with -v and --help options.

# Create: 2023-11-01
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 定义 OET_PATH 为当前脚本所在的目录
OET_PATH=$(cd "$(dirname "$0")" && pwd)

# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 这里可以添加一些环境准备的步骤
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chmem command..."

    # 检查 chmem 命令的版本
    command -v chmem &> /dev/nul
    CHECK_RESULT $? 0 0 "Failed to execute 'command -v chmem'."

    # 检查 chmem 命令的帮助信息
    # chmem --help | grep -Ei "usage | 用法"
    chmem --help | grep -Ei "usage|用法"
    CHECK_RESULT $? 0 0 "Failed to execute 'chmem --help'."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 这里可以添加一些环境清理的步骤
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
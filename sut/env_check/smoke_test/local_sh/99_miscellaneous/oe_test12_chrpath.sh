#!/usr/bin/bash

# Describe: This script is used to check the functionality of the chrpath command with -v and --help options.

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
    # 环境准备可能包括其他步骤，这里仅作为示例
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chrpath command..."

    # 检查 chrpath 命令是否存在
    if ! command -v chrpath &>/dev/null; then
        LOG_ERROR "chrpath command is not installed."
        CHECK_RESULT 1 0 0 "chrpath is required for this test."
        return
    fi

    # 检查 chrpath -v 选项
    LOG_INFO "Checking chrpath -v option..."
    chrpath -v | grep -q "chrpath version"
    CHECK_RESULT $? 0 0 "Failed to execute 'chrpath -v' or unexpected output."

    # 检查 chrpath --help 选项
    LOG_INFO "Checking chrpath --help option..."
    chrpath --help | grep -q "Usage"
    CHECK_RESULT $? 0 0 "Failed to execute 'chrpath --help' or unexpected output."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 如果有创建文件或目录，确保在这里删除它们
    # 示例：rm -rf "/tmp/somedir_$current_date_time"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
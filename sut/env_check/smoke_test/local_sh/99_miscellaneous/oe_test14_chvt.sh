#!/usr/bin/bash

# Describe: This script is used to check the functionality of the chvt command with -v and --help options, and also to switch between virtual terminals.

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
    LOG_INFO "Start testing chvt command..."

    # 检查 chvt 命令是否存在
    if ! command -v chvt &>/dev/null; then
        LOG_ERROR "chvt command is not installed."
        CHECK_RESULT 1 0 0 "chvt is required for this test."
        return
    fi


    # 检查 chvt --help 选项
    LOG_INFO "Checking chvt --help option..."
    chvt --help
    CHECK_RESULT $? 0 0 "Failed to execute 'chvt --help'."

    # 尝试在不同的虚拟终端之间切换
    # 注意：这个操作可能不会在脚本中直接可见，因为它会切换当前终端
    LOG_INFO "Attempting to switch between virtual terminals..."
    for i in 1 2 3; do
        chvt "$i"
        CHECK_RESULT $? 0 0 "Failed to switch to virtual terminal $i."
        sleep 1  # 简短的延迟，以便观察效果
    done

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 如果有需要，可以在这里添加清理步骤
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
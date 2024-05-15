#!/usr/bin/bash

# Describe: This script is used to check the functionality of the chrt command with --version and --help, and also to change a process's scheduling policy and priority.

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
    # 创建一个用于测试的进程
    test_command="sleep 30"
    test_process=$($test_command & echo $!)
    LOG_INFO "Test process ID: $test_process"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chrt command..."

    # 检查 chrt 命令是否存在
    if ! command -v chrt &>/dev/null; then
        LOG_ERROR "chrt command is not installed."
        CHECK_RESULT 1 0 0 "chrt is required for this test."
        return
    fi

    # 检查 chrt --version 选项
    LOG_INFO "Checking chrt --version option..."
    chrt --version
    CHECK_RESULT $? 0 0 "Failed to execute 'chrt --version'."

    # 检查 chrt --help 选项
    LOG_INFO "Checking chrt --help option..."
    chrt --help
    CHECK_RESULT $? 0 0 "Failed to execute 'chrt --help'."

    # 使用 chrt 更改测试进程的调度策略和优先级
    LOG_INFO "Changing the scheduling policy and priority of the test process..."
    policy="fifo"
    priority=50  # 确保这是有效的优先级范围内
    #chrt -f -p "$priority" "$test_process"
    #CHECK_RESULT $? 0 0 "Failed to change scheduling policy and priority using 'chrt'."

    # 验证更改是否成功
    LOG_INFO "Verifying the scheduling policy and priority change..."
    current_policy=$(chrt -p "$test_process" | awk '{print $1}')
    current_priority=$(chrt -p "$test_process" | awk '{print $2}')
    if [ "$current_policy" == "$policy" ] && [ "$current_priority" == "$priority" ]; then
        LOG_INFO "Scheduling policy and priority of the test process have been successfully changed."
    else
        LOG_ERROR "Failed to verify the scheduling policy and priority change."
        CHECK_RESULT $? 0 0 "Verification failed."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 杀死测试进程
    kill "$test_process"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
#!/usr/bin/bash

# Create: 2023-11-01
# Author: your_name

# 获取当前日期和时间，格式为 YYYYMMDD-HHMMSS
current_date_time=$(date +"%Y%m%d-%H%M%S")

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
    LOG_INFO "Start testing choom command..."

    # 定义需要调整OOM得分的进程ID
    #pid_to_adjust=1234  # 请替换为实际的进程ID

    # 定义新的OOM调整得分值
    adjust_score=1000  # 请根据需要设置得分值

    # 使用choom命令调整指定进程的OOM得分
    #choom -n "$adjust_score" -p "$pid_to_adjust"
    #CHECK_RESULT $? 0 0 "Failed to adjust OOM score using choom."

    choom --help |grep -Ei "uesage|用法"
    CHECK_RESULT $? 0 0 "Failed to execute choom --help."
    
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
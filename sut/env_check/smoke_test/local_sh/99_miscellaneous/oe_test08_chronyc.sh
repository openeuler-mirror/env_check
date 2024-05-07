#!/usr/bin/bash

# Describe: This script demonstrates the use of chronyc to manage NTP services and time synchronization.

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
    # 确保 chrony 服务已经安装并启动
    if ! systemctl is-active --quiet chronyd; then
        LOG_WARN "chronyd service is not active. Starting it now."
        sudo systemctl start chronyd
        CHECK_RESULT $? 0 0 "Failed to start chronyd service."
    fi
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chronyc command..."

    # 检查 NTP 服务器状态
    LOG_INFO "Checking NTP server status..."
    sudo chronyc tracking
    CHECK_RESULT $? 0 0 "chronyc tracking command failed."

    # 强制与 NTP 服务器同步时间
    LOG_INFO "Synchronizing time with NTP server..."
    sudo chronyc -a makestep
    CHECK_RESULT $? 0 0 "chronyc makestep command failed."

    # 检查同步后的时间偏差
    LOG_INFO "Checking time offset after synchronization..."
    sudo chronyc tracking -w
    CHECK_RESULT $? 0 0 "chronyc tracking with waver option command failed."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 无需要清理的环境资源
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
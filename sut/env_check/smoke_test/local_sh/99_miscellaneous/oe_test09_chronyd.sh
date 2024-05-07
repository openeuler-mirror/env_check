#!/usr/bin/bash

# Describe: This script manages chronyd service and performs basic NTP operations.

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
    # 确保 chronyd 服务已经安装
    if ! command -v chronyd &>/dev/null; then
        LOG_WARN "chronyd is not installed. Installing it now."
        sudo yum install chrony  # 根据你的系统使用适当的包管理器和命令
        CHECK_RESULT $? 0 0 "Failed to install chronyd."
    fi
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chronyd service..."

    # 启动 chronyd 服务
    LOG_INFO "Starting chronyd service..."
    sudo systemctl start chronyd
    CHECK_RESULT $? 0 0 "Failed to start chronyd service."

    # 检查 chronyd 服务状态
    LOG_INFO "Checking chronyd service status..."
    if ! sudo systemctl is-active --quiet chronyd; then
        LOG_ERROR "chronyd service is not active."
        CHECK_RESULT 1 0 0 "chronyd service is not running."
    fi

    # 检查同步状态
    LOG_INFO "Checking synchronization status..."
    if ! chronyc tracking | grep -q 'Ref time'; then
        LOG_ERROR "chronyd is not tracking time."
        CHECK_RESULT 1 0 0 "chronyd is not tracking time."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 停止 chronyd 服务
    sudo systemctl stop chronyd
    CHECK_RESULT $? 0 0 "Failed to stop chronyd service."
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
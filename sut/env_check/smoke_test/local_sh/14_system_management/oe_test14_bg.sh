#!/usr/bin/bash
# Create: 2024-05-21 10:01:12
# Auther: hebinxin
# Description: A shellscript to check bg command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 1. test bg

    # 启动一个运行5s的命令
    sleep 5 &
    sleep_pid=$!

    # 输出启动信息
    echo "Started sleep with PID $sleep_pid"
    
    # # 暂停该进程（相当于按下 Ctrl+Z）
    # kill -STOP $sleep_pid
    # echo "Process $sleep_pid has been stopped."

    # # 等待1秒
    # sleep 1

    # # 恢复该进程
    # kill -CONT $sleep_pid
    # echo "Process $sleep_pid has been continued."

    # 将该进程放到后台运行
    bg %1
    CHECK_RESULT $? 1 0 "bg error"

    echo "Process $sleep_pid has been moved to background."
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
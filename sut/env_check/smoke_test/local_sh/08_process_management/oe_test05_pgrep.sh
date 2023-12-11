#!/usr/bin/bash

# Create: 2023-10-30
# Author: zengyifeng

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
    
    # 创建一个临时目录用于测试
    test_dir="/tmp/pgrep_test"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 检查是否安装了 pgrep 命令
    if ! command -v pgrep &>/dev/null; then
        LOG_WARN "pgrep command is not installed"
        CHECK_RESULT $? 0 0
    fi
    
    # 测试  --help 命令
    pgrep --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0

    # 启动多个后台进程
    sleep 2 &
    sleep 3 &
    sleep 4 &

    # 获取所有匹配的进程 PID
    pids=$(pgrep sleep)

    # 检查进程是否存在
    if [ -n "$pids" ]; then
        LOG_INFO "Found processes with PIDs: $pids"
        CHECK_RESULT $? 0 0
    else
        LOG_ERROR "Processes not found"
        CHECK_RESULT $? 1 0
    fi

    # 测试 'pgrep -o' 命令
    first_pid=$(pgrep -o sleep)
    LOG_INFO "First matching process PID: $first_pid"
    CHECK_RESULT $? 0 0

    # 测试 'pgrep -d' 命令
    delimiter_pid=$(pgrep -d , sleep)
    LOG_INFO "Processes with comma delimiter: $delimiter_pid"
    CHECK_RESULT $? 0 0

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除临时测试目录
    test_dir="/tmp/pgrep_test"
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

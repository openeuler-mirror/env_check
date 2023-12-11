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
    test_dir="/tmp/nohup_test"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 检查是否安装了 nohup 命令
    if ! command -v nohup &>/dev/null; then
        LOG_WARN "nohup command is not installed"
        CHECK_RESULT $? 0 0
        
    else
        # 测试  --help 命令
        nohup --help | grep -E "Usage|用法"
        CHECK_RESULT $? 0 0
        
        # 启动一个后台进程
        nohup sleep 2 >/dev/null 2>&1 &
    
        # 等待进程完成
        wait
    
        # 测试 'nohup --help' 命令
        nohup --help | grep -E "Usage|用法"
        CHECK_RESULT $? 0 0 "Failed to execute 'nohup --help'."
    
        # 测试 'nohup --version' 命令
        nohup --version
        CHECK_RESULT $? 0 0 "Failed to execute 'nohup --version'."
        
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除临时测试目录
    test_dir="/tmp/nohup_test"
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

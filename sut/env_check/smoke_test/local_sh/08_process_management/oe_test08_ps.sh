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
    test_dir="/tmp/ps_test"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 检查是否安装了 ps 命令
    if ! command -v ps &>/dev/null; then
        LOG_WARN "ps command is not installed"
        CHECK_RESULT $? 0 0
    fi
    
    # 测试  --help 命令
    ps --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0

    # 运行一个后台进程
    sleep 6 &

    # 使用 'ps' 命令列出所有进程
    ps -A

    # 检查 'ps' 命令是否成功执行
    CHECK_RESULT $? 0 0

    # 使用 'ps' 命令查看特定用户的进程
    ps -u "$USER"

    # 检查 'ps' 命令是否成功执行
    CHECK_RESULT $? 0 0

    # 使用 'ps' 命令查看进程树
    ps -ejH

    # 检查 'ps' 命令是否成功执行
    CHECK_RESULT $? 0 0

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除临时测试目录
    test_dir="/tmp/ps_test"
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

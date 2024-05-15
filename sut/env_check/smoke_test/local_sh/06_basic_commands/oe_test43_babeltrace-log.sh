#!/usr/bin/bash
# Create: 2024-05-15 10:08:07
# Auther: wangdong
# Description:   babeltrace-log -  Convert a Linux kernel ring buffer to a CTF trace
# 简介: babeltrace-log 是一个用于处理和分析 Babeltrace 跟踪数据的工具

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
    # 检查 babeltrace-log 命令是否安装。
    if ! command -v babeltrace-log &> /dev/null; then
        LOG_WARN "babeltrace-log command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    babeltrace-log --help
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

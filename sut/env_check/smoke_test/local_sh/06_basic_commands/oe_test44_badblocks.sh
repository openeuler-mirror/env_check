#!/usr/bin/bash
# Create: 2024-05-20 10:08:07
# Auther: wangdong
# Description:   babblocks - search a device for bad blocks
# 简介: badblocks命令用于检查磁盘装置中损坏的区块

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
    if ! command -v badblocks &> /dev/null; then
        LOG_WARN "babblocks command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    badblocks -h
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

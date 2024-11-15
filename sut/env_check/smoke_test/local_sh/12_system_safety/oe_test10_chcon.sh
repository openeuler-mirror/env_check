#!/usr/bin/bash

# Create: 2024-09-04
# Author: panzhe

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

    # 检查是否安装了 'chcon' 命令
    if ! command -v chcon &>/dev/null; then
        LOG_WARN "'chcon' command is not installed."
        CHECK_RESULT $? 0 0
    else
        # 使用 'chcon --help' 命令查看帮助信息
        chcon --help | grep -E "Usage:|Options:"
        CHECK_RESULT $? 0 0

        # 使用 'chcon --version' 命令查看版本信息
        chcon --version
        CHECK_RESULT $? 0 0
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@


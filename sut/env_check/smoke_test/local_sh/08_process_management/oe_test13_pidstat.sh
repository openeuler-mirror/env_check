#!/usr/bin/bash

# Create: 2024-09-25
# Author: chengjun

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
    LOG_INFO "Start pidstat testing..."

    # 检查是否安装了 'pidstat' 命令
    if ! command -v pidstat &>/dev/null; then
        LOG_WARN "'pidstat' command is not installed."
        CHECK_RESULT $? 0 0
    else

        # 使用 'pidstat -u' 命令查看各个进程的cpu使用统计
        pidstat -u
        CHECK_RESULT $? 0 0

        # 使用 'pidstat -V' 命令查看版本信息
        pidstat -V
        CHECK_RESULT $? 0 0
    fi

    LOG_INFO "Finish pidstat test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

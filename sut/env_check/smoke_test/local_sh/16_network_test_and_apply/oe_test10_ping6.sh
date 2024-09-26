#!/usr/bin/bash
# Create: 2024-09-25
# Auther: chengjun
# Description: A shellscript to check ping6 command.

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

    # 检查是否安装了 'ping6' 命令
    if ! command -v ping6 &>/dev/null; then
        LOG_WARN "'ping6' command is not installed."
        CHECK_RESULT $? 0 0
    else

        # 1. test ping6 -c
        ping6 ::1 -c 4 | grep -E "4 packets"
        CHECK_RESULT $? 0 0 "ping6 -c error"

        # 2. test ping6 -v
        ping6 -c 1 ::1 -v
        CHECK_RESULT $? 0 0

        # 3.test ping -D
        ping6 -c 1 ::1 -D
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
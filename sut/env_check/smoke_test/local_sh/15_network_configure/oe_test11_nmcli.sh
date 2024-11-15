#!/usr/bin/bash
# Create: 2024-09-26
# Auther: chengjun
# Description: A shellscript to check nmcli command.

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

    # 检查是否安装了 'nmcli' 命令
    if ! command -v nmcli &>/dev/null; then
        LOG_WARN "'nmcli' command is not installed."
        CHECK_RESULT $? 0 0
    else

        # 1.打印nmcli版本信息
        nmcli -v
        CHECK_RESULT $? 0 0

        # 2.打印设备网络连接信息
        nmcli c s
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
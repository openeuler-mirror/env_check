#!/usr/bin/bash
# Create: 2024-11-25 15:26:02
# Auther: hebinxin
# Description: A shellscript to check captoinfo command.
# What is captoinfo: it's a tool to transform items in database to terminfo format.

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
    # check whether captoinfo is or not installed
    if ! command -v captoinfo &> /dev/null; then
        LOG_WARN "captoinfo command is not installed."
        CHECK_RESULT $? 0 0
    else
        # test captoinfo -V
        captoinfo -V
        CHECK_RESULT $? 0 0 "captoinfo -V error"
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

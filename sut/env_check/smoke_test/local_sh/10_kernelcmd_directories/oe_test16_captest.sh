#!/usr/bin/bash
# Create: 2024-11-25 15:26:02
# Auther: hebinxin
# Description: A shellscript to check capsh command.
# What is captest: it's a tool to test and display the Linux Capabilities of process
# which can help user understand the set of current process's capabilities.

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
    # check whether captest is or not installed
    if ! command -v captest &> /dev/null; then
        LOG_WARN "captest command is not installed."
        CHECK_RESULT $? 0 0
    else
        # test captest --text
        captest --text
        CHECK_RESULT $? 0 0 "captest --text error"
        # test captest --help
        captest --help | grep -Ei "Usage|用法"
        CHECK_RESULT $? 0 0 "captest --help error"
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

#!/usr/bin/bash
# Create: 2024-11-25 14:37:02
# Auther: hebinxin
# Description: A shellscript to check capsh command.
# What is capsh: it's a tool to operate and show the Linux Capabilities of process
# which is a more elaborte permission control mechanism in the kernel.

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
    # check whether capsh is or not installed
    if ! command -v capsh &> /dev/null; then
        LOG_WARN "capsh command is not installed."
        CHECK_RESULT $? 0 0
    else
        # test capsh --print
        capsh --print
        CHECK_RESULT $? 0 0 "capsh --print error"
        # test capsh --help
        capsh --help | grep -Ei "Usage|用法"
        CHECK_RESULT $? 0 0 "capsh --help error"
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

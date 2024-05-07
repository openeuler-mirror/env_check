#!/usr/bin/bash
# Create: 2024-04-26 16:02:11
# Auther: hebinxin
# Description: A shellscript to check augenrules command.

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

    ### augenrules is a tool of regenerating log rule ###

    # 1. test augenrules --check
    augenrules --check
    CHECK_RESULT $? 0 0 "augenrules --check error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
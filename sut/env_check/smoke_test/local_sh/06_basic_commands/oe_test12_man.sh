#!/usr/bin/bash
# Create: 2023-09-22 17:26:39
# Auther: hebinxin
# Description: A shellscript to check man command.

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
    # check man cp 
    manstr=$(man -aw cp | awk -F "/" '{print $4}')
    [ $manstr = "man" ]
    CHECK_RESULT $? 0 0 "man cp error"
    # check man --help
    man --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "man --help error"
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

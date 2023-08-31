#!/usr/bin/bash
# Create: 2023-08-30 14:43:30
# Auther: hebinxin
# Description: A shellscript to check cal(calendar tool) command.

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
    # check cal day
    cal | grep "Su"
    CHECK_RESULT $? 0 0 "cal day display error"
    # check cal -y
    cal -y | grep "December"
    CHECK_RESULT $? 0 0 "cal -y error"
    # check cal -m
    first_day=$(cal -m | cut -c 1 | sed -n 2p)
    [ $first_day = "M" ]
    CHECK_RESULT $? 0 0 "cal -m error"
    # check cal -s
    first_day=$(cal -s | cut -c 1 | sed -n 2p)
    [ $first_day = "S" ]
    CHECK_RESULT $? 0 0 "cal -s error"
    # check cal help
    cal --help | grep -E "Usage|用法"
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
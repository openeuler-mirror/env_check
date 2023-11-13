#!/usr/bin/bash
# Create: 2023-10-25 09:49:17
# Auther: hebinxin
# Description: A shellscript to check stat command.

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
    # check stat oe_test19_stat
    # get "oe_test19_stat" filename
    filename=$(stat $0 | grep -E "文件|File" | sed -n 1p | awk -F '[/.]' '{print $(NF-1)}')
    [ $filename = "oe_test19_stat" ]
    CHECK_RESULT $? 0 0 "stat error"
    # check stat --help
    stat --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "stat --help error"
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

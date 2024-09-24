#!/usr/bin/bash
# Create: 2024-9-24 10:51:45
# Auther: gaoyanjun
# Description: A shellscript to check uname command.

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
    
    # test uname -a
    uname -a
    CHECK_RESULT $? 0 0 "uname -a error"

    # test uname -s
    uname -s
    CHECK_RESULT $? 0 0 "uname -s error"

    # test uname -n
    uname -n
    CHECK_RESULT $? 0 0 "uname -n error"

    # test uname -r
    uname -r
    CHECK_RESULT $? 0 0 "uname -r error"

    # test uname -v
    uname -v
    CHECK_RESULT $? 0 0 "uname -v error"

    # test uname -m
    uname -m
    CHECK_RESULT $? 0 0 "uname -m error"

    # test uname -p
    uname -p
    CHECK_RESULT $? 0 0 "uname -p error"

    # test uname -i
    uname -i
    CHECK_RESULT $? 0 0 "uname -i error"

    # test uname -o
    uname -o
    CHECK_RESULT $? 0 0 "uname -o error"

    # test uname --help
    uname --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "uname --help error"

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

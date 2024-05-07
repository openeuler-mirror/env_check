#!/usr/bin/bash
# Create: 2024-05-06 14:13:13
# Auther: hebinxin
# Description: A shellscript to check ausyscall command.

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

    ### ausyscall is a tool of querying the number and corresponding name of a Linux system call ###

    # 1. test ausyscall 1
    res1=$(ausyscall 1)
    [ $res1 = "write" ]
    CHECK_RESULT $? 0 0 "ausyscall 1 error"

    # 2. test ausyscall 2
    res1=$(ausyscall 2)
    [ $res1 = "open" ]
    CHECK_RESULT $? 0 0 "ausyscall 2 error"

    # 3. test ausyscall 3
    res1=$(ausyscall 3)
    [ $res1 = "close" ]
    CHECK_RESULT $? 0 0 "ausyscall 3 error"

    # 1. test ausyscall 4
    res1=$(ausyscall 4)
    [ $res1 = "stat" ]
    CHECK_RESULT $? 0 0 "ausyscall 4 error"
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
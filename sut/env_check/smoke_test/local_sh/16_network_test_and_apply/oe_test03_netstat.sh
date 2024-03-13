#!/usr/bin/bash
# Create: 2024-03-04 16:00:24
# Auther: hebinxin
# Description: A shellscript to check netstat command.

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

    # 1. test netstat -r : print route table
    netstat -r
    CHECK_RESULT $? 0 0 "netstat -r error"

    # 2. test netstat -a : show all activing socket connection
    netstat -a
    CHECK_RESULT $? 0 0 "netstat -a error"

    # 3. test netstat -i : show the state of all network interface
    netstat -i
    CHECK_RESULT $? 0 0 "netstat -i error"

    # 4. test netstat -t : show connect state of TCP protocol
    netstat -t
    CHECK_RESULT $? 0 0 "netstat -t error"

    # 5. test netstat --h
    netstat -h
    CHECK_RESULT $? 0 0 "netstat -h error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
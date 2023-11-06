#!/usr/bin/bash
# Create: 2023-11-06 10:38:56
# Auther: hebinxin
# Description: A shellscript to check yes command.

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
    # check yes hello
    cur_path=$(pwd)
    yes > $(cur_path)/output.txt &
    yes_pid=$!
    sleep 2
    ps -p $yes_pid > /dev/null
    CHECK_RESULT $? 0 0 "yes error"
    kill $yes_pid
    rm -f $(cur_path)/output.txt
    # check yes --help
    yes --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "yes --help error"
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

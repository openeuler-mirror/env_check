#!/usr/bin/bash
# Create: 2023-10-30 11:14:15
# Auther: hebinxin
# Description: A shellscript to check whatis command.
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
    # check whatis ls
    msg=$(whatis ls | grep "ls (1)" | awk -F '- ' '{print $NF}')
    [ "$msg" = "list directory contents" ]
    CHECK_RESULT $? 0 0 "whatis error"
    # check whatis --help
    whatis --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "whatis --help error"
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

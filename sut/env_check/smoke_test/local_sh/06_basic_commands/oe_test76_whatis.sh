#!/usr/bin/bash
# Create: 2024-10-25 
# Auther: gaoyanjun
# Description: A shellscript to check whereis command.

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
    # check whatis for a known command (vi)
    result=$(whatis vi)
    expected="vi (1)               - Vi IMproved, a programmer's text editor"
    if [[ $result == *"$expected"* ]]; then
        CHECK_RESULT 0 0 0 "whatis for 'vi' is correct"
    else
        CHECK_RESULT 1 0 0 "whatis for 'vi' is incorrect"
    fi

    # check whatis with no arguments
    result=$(whatis)
    if [[ $? -ne 0 ]]; then
        CHECK_RESULT 0 0 0 "whatis with no arguments returns an error as expected"
    else
        CHECK_RESULT 1 0 0 "whatis with no arguments should return an error"
    fi

    # check whatis --help
    result=$(whatis --help)
    if [[ $result =~ Usage ]] || [[ $result =~ 用法 ]]; then
        CHECK_RESULT 0 0 0 "whatis --help displays usage information"
    else
        CHECK_RESULT 1 0 0 "whatis --help does not display usage information"
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main$@

#!/usr/bin/bash
# Create: 2024-10-31 
# Auther: gaoyanjun
# Description: A shellscript to check pwd command.

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

 # Test basic functionality of pwd command
    current_dir=$(pwd)
    if [[ -d "$current_dir" ]]; then
        CHECK_RESULT 0 0 0 "pwd command executed successfully"
    else
        CHECK_RESULT 1 0 0 "pwd command did not return a valid directory"
    fi

    # Test pwd -L option
    result=$(pwd -L)
    if [[ "$result" == "$current_dir" ]]; then
        CHECK_RESULT 0 0 0 "pwd -L option works correctly"
    else
        CHECK_RESULT 1 0 0 "pwd -L option did not return the logical path"
    fi

    # Test pwd -P option
    result=$(pwd -P)
    if [[ "$result" == "$current_dir" ]]; then
        CHECK_RESULT 0 0 0 "pwd -P option works correctly"
    else
        CHECK_RESULT 1 0 0 "pwd -P option did not return the physical path"
    fi

    # Check pwd --help option
    result=$(pwd --help)
    if [[ $result =~ "pwd" ]] ; then
        CHECK_RESULT 0 0 0 "pwd --help displays correct help information"
    else
        CHECK_RESULT 1 0 0 "pwd --help does not display correct help information"
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

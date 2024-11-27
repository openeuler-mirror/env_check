#!/usr/bin/bash
# Create: 2024-11-25 
# Auther: gaoyanjun
# Description: A shellscript to check nl-addr-list command.

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

    # Test basic functionality of nl-addr-list command
    result=$(nl-addr-list)
    if [[ $? -eq 0 ]] && [[ $result =~ "inet" ]]; then
        CHECK_RESULT 0 0 0 "nl-addr-list command executed successfully"
    else
        CHECK_RESULT 1 0 0 "nl-addr-list command did not return valid output"
    fi



    # Check nl-addr-list --version option
    result=$(nl-addr-list --version 2>&1)
    if [[ $? -eq 0 ]] && [[ $result =~ "libnl tools version " ]] ; then
        CHECK_RESULT 0 0 0 "nl-addr-list --version displays version information"
    else
        CHECK_RESULT 1 0 0 "nl-addr-list --version does not display version information"
    fi

    # Check nl-addr-list --help option
    result=$(nl-addr-list --help 2>&1)
    if [[ $? -eq 0 ]] && [[ $result =~ "Usage:" ]] || [[ $result =~ "用法:" ]]; then
        CHECK_RESULT 0 0 0 "nl-addr-list --help displays correct help information"
    else
        CHECK_RESULT 1 0 0 "nl-addr-list --help does not display correct help information"
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

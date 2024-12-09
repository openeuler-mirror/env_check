#!/usr/bin/bash
# Create: 2024-11-29 
# Auther: gaoyanjun
# Description: A shellscript to check nl-link-list command.

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
    
    # Test basic nl-link-list command
    result=$(nl-link-list 2>&1)
    if [[ $? -eq 0 ]]&& [[ $result =~ "lo" ]]; then
	
        CHECK_RESULT 0 0 0 "$result" "nl-link-list displays correct information"
    else
        CHECK_RESULT 1 0 0 "$result" "nl-link-list does not display correct information"
    fi


    # Test nl-link-list -h option
    result=$(nl-link-list -h 2>&1)
    if [[ $? -eq 0 ]] && [[ $result =~ "Usage:" ]] && [[ $result =~ "Options:" ]]; then
        CHECK_RESULT 0 0 "$result" "nl-link-list -h displays correct help information"
    else
        CHECK_RESULT 1 0 "$result" "nl-link-list -h does not display correct help information"
    fi

    # Test nl-link-list -v option
    result=$(nl-link-list -v 2>&1)
    if [[ $? -eq 0 ]] && [[ $result =~ "Version" ]]; then
        CHECK_RESULT 0 0 "$result" "nl-link-list -v displays correct version information"
    else
        CHECK_RESULT 1 0 "$result" "nl-link-list -v does not display correct version information"
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

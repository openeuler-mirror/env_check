#!/usr/bin/bash
# Create: 2024-11-28
# Auther: gaoyanjun
# Description: A shellscript to check type command.

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
    
    # Test type with built-in command
    result=$(type cd)
    if [[ $? -eq 0 ]] && [[ $result =~ "cd is a shell builtin" ]]; then
        CHECK_RESULT 0 0 0 "type command executed successfully for 'cd'"
    else
        CHECK_RESULT 1 0 0 "type command did not return valid output for 'cd'"
    fi
    
    # Test type -p option
    result=$(type -p vi)
    if [[ $? -eq 0 ]] && [[ $result =~ "/bin/vi" ]]; then
        CHECK_RESULT 0 0 0 "type -p option works correctly for 'vi'"
    else
        CHECK_RESULT 1 0 0 "type -p option did not return valid output for 'vi'"
    fi

    # Test type -t option
    result=$(type -t ls)
    if [[ $? -eq 0 ]]; then
        if [[ $result == "alias" ]]; then
            CHECK_RESULT 0 0 0 "type -t option works correctly for 'ls' (alias)"
        elif [[ $result == "file" ]]; then
            CHECK_RESULT 0 0 0 "type -t option works correctly for 'ls' (file)"
        else
            CHECK_RESULT 1 0 0 "type -t option returned unexpected type for 'ls': $result"
        fi
    else
        CHECK_RESULT 1 0 0 "type -t option did not return valid output for 'ls'"
    fi

    # Test type -a option
    result=$(type -a ls)
    if [[ $? -eq 0 ]] && [[ $result =~ "ls is" ]] && [[ $result =~ "/bin/ls" ]]; then
        CHECK_RESULT 0 0 0 "type -a option works correctly for 'ls'"
    else
        CHECK_RESULT 1 0 0 "type -a option did not return valid output for 'ls'"
    fi

    # Check type --help option
    result=$(type --help 2>&1)
    if [[ $? -eq 0 ]] && [[ $result =~ "type: type" ]] && [[ $result =~ "选项：" ]]; then
        CHECK_RESULT 0 0 "$result" "type --help displays correct help information"
    else
        CHECK_RESULT 1 0 "$result" "type --help does not display correct help information"
    fi

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

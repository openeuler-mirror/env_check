#!/usr/bin/bash
# Create: 2024-10-25
# Auther: gaoyanjun
# Description: A shellscript to check sync command.

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
   
    # Test basic functionality of sync command
    sync
    CHECK_RESULT $? 0 0 "sync command executed successfully"

    # Check sync --version option
    result=$(sync --version)
    if [[ $result =~ "sync " ]] || [[ $result =~ "Sync " ]]; then
        CHECK_RESULT 0 0 0 "sync --version displays version information"
    else
        CHECK_RESULT 1 0 0 "sync --version does not display version information"
    fi

    # Check sync --help option
    result=$(sync --help)
    if [[ $result =~ Usage ]] || [[ $result =~ 用法 ]]; then
        CHECK_RESULT 0 0 0 "sync --help displays usage information"
    else
        CHECK_RESULT 1 0 0 "sync --help does not display usage information"
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


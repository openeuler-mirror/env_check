#!/usr/bin/bash
# Create: 2024-11-29 14:37:20
# Auther: hebinxin
# Description: A shellscript to check ca-legacy command.

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

    if ! command -v ca-legacy &> /dev/null; then
        LOG_WARN "ca-legacy command is not installed."
        CHECK_RESULT $? 0 0
    else
        # test ca-legacy -h
        ca-legacy -h |  grep -Ei "Usage|用法"
        CHECK_RESULT $? 0 0 "ca-legacy -h error"

        # test ca-legacy check
        ca-legacy check
        CHECK_RESULT $? 0 0 "ca-legacy check error"

        LOG_INFO "Finish test!"
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@


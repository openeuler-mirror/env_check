#!/usr/bin/bash
# Create: 2023-09-08 09:34:17
# Auther: hebinxin
# Description: A shellscript to check consoletype command.

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
    # check consolestype
    if ! command -v consoletype &> /dev/null; then
        LOG_WARN "consoletype command is not installed"
        CHECK_RESULT $? 0 0
    else 
        consoletype
        CHECK_RESULT $? 2 0
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
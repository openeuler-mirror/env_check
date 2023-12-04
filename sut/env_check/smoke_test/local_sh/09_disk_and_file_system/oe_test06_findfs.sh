#!/usr/bin/bash
# Create: 2023-11-28 14:26:11
# Auther: hebinxin
# Description: A shellscript to check findfs command.

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

    # 1. test findfs UUID
    fs=$(df -h | grep "/boot" | awk -F ' ' '{print $1}' )
    uuid=$(blkid /dev/sda1 | awk -F '[="]' '{print $3}')
    findfs UUID=$uuid
    CHECK_RESULT $? 0 0 "findfs UUID error"

    # 2. test findfs --help
    findfs --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "findfs --help error"

    LOG_INFO "Finish test!"
}

环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@


#!/usr/bin/bash
# Create: 2024-01-18 13:55:23
# Auther: hebinxin
# Description: A shellscript to check arp command.

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

    # 1. test arp -a
    arp -a
    CHECK_RESULT $? 0 0 "arp -a error"

    # 2. test arp -e : show content in the arp buffer in Linux style
    arp -e
    CHECK_RESULT $? 0 0 "arp -e error"

    # 3. test arp -n : show host info in the arp buffer in numerical sytle
    arp -n
    CHECK_RESULT $? 0 0 "arp -n error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@


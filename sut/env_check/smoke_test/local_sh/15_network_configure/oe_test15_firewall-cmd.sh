#!/usr/bin/bash
# Create: 2024-11-26 
# Auther: zhangxijing
# Description: A shellscript to check firewall-cmd command.

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

    # 获取当前活动的区域
    LOG_INFO "Getting the active zone..."
    firewall-cmd --get-active-zones
    CHECK_RESULT $?

    # 获取默认区域
    LOG_INFO "Getting the default zone..."
    firewall-cmd --get-default-zone
    CHECK_RESULT $?

    # 列出所有区域的信息
    LOG_INFO "Listing all zones..."
    firewall-cmd --list-all-zones
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main$@

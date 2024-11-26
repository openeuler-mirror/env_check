#!/usr/bin/bash

# Create: 2024-10-31
# Author: wangbo

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

    # 测试 systemd-analyze blame
    LOG_INFO "Running 'systemd-analyze blame'..."
    systemd-analyze blame
    CHECK_RESULT $?

    # 测试 systemd-analyze time
    LOG_INFO "System boot time:"
    systemd-analyze time
    CHECK_RESULT $?

    # 测试 systemd-analyze critical-chain
    LOG_INFO "Critical chain of service dependencies:"
    systemd-analyze critical-chain
    CHECK_RESULT $?

    # 测试 systemd-analyze dot
    LOG_INFO "Creating a DOT graph of service dependencies..."
    systemd-analyze dot > systemd_dependencies.dot
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    rm -f /tmp/env_*.txt
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

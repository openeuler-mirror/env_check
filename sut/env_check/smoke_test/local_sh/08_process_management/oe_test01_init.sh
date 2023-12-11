#!/bin/bash

# Create: 2023-10-29
# Author: zengyifeng

# 获取脚本所在路径
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

    # 使用command -v检查init指令是否存在
    if command -v init &>/dev/null; then
        LOG_INFO "init command is installed"
        CHECK_RESULT 0 0 0 "init command is installed"
    else
        LOG_WARN "init command is not installed"
        CHECK_RESULT 0 0 1 "init command is not installed"
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

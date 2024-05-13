#!/usr/bin/bash
# Create: 2024-05-13 10:48:07
# Auther: wangdong
# Description:   b2sum - compute and check BLAKE2 message digest
# 简介: 计算并校验 BLAKE2 信息摘要

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
    # 检查 b2sum 命令是否安装。
    if ! command -v b2sum &> /dev/null; then
        LOG_WARN "b2sum command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    b2sum --help
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# Create: 2024-05-06 9:48:07
# Auther: wangdong
# Description:   aulastlog - a program similar to lastlog
# 简介：打印出所有用户的最后登录信息

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
    # 检查 aulastlog 命令是否安装。
    if ! command -v aulastlog &> /dev/null; then
        LOG_WARN "aulastlog command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 测试aulastlog指令
    aulastlog
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

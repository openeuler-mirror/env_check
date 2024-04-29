#!/usr/bin/bash
# Create: 2024-04-29 16:18:07
# Auther: wangdong
# Description:   aulast - a program similar to last
# aulast 是一个用于打印出最后一次登录用户的列表的Linux程序，它与 last 和 lastb 命令类似

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
    # 检查 aulast 命令是否安装。
    if ! command -v aulast &> /dev/null; then
        LOG_WARN "aulast command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 测试aulast指令
    aulast
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

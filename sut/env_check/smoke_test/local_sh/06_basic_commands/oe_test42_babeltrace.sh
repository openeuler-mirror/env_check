#!/usr/bin/bash
# Create: 2024-05-14 11:08:07
# Auther: wangdong
# Description:   babeltrace -  Convert or process one or more traces, and more
# 简介: Babeltrace 是一个用于追踪和分析系统调用、内核函数调用以及程序执行的开源工具

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
    # 检查 babeltrace 命令是否安装。
    if ! command -v babeltrace &> /dev/null; then
        LOG_WARN "babeltrace command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    babeltrace --help
    CHECK_RESULT $?

    #  List available formats
    babeltrace -l
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

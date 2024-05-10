#!/usr/bin/bash
# Create: 2024-05-07 16:48:07
# Auther: wangdong
# Description:   autogen -  The Automated Program Generator
# 简介：autogen 是一个用于自动生成源代码中某些部分的工具，这些部分在每次编译时都可能需要更新，比如配置脚本的输出。

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
    # 检查 autogen 命令是否安装。
    if ! command -v autogen &> /dev/null; then
        LOG_WARN "autogen command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    autogen --help
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

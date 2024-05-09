#!/usr/bin/bash
# Create: 2024-05-07 16:48:07
# Auther: wangdong
# Description:   autoreconf - Update generated configuration files
# 简介：autoreconf 是一个用于自动生成 configure 脚本和 Makefile.in 文件的命令，这些文件通常在源代码包中找到。

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
    if ! command -v autoreconf &> /dev/null; then
        LOG_WARN "autoreconf command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    autoreconf -h
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

#!/usr/bin/bash
# Create: 2024-05-07 16:48:07
# Auther: wangdong
# Description:   autoconf -  Generate configuration scripts
# 简介：生成configure脚本的工具,根据 configure.in 或 configure.ac 文件生成一个名为 configure 的脚本

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
    # 检查 autoconf 命令是否安装。
    if ! command -v autoconf &> /dev/null; then
        LOG_WARN "autoconf command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看aulast版本
    autoconf -V
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

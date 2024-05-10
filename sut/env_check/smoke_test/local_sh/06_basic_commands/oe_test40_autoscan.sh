#!/usr/bin/bash
# Create: 2024-05-07 16:48:07
# Auther: wangdong
# Description:   autoscan -  Generate a preliminary configure.in
# 简介：autoscan 是一个在 Linux 系统中用于自动检测和配置 SCSI 设备（包括 SATA、USB 以及通过 SCSI 通用驱动程序连接的设备）的小工具。它是 lsscsi 命令的补充，可以列出当前系统上所有已连接的 SCSI 设备。


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
    # 检查 autoscan 命令是否安装。
    if ! command -v autoscan &> /dev/null; then
        LOG_WARN "autoscan command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 查看帮助
    autoscan -h
    CHECK_RESULT $?
    autoscan -V
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

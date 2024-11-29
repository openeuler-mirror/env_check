#!/usr/bin/bash
# author: wangdong
# Create: 2024-11-27  14:30
# Description: test the fsadm command - fsadm 是一个用于管理和维护文件系统的命令行工具，特别是在 Red Hat 系列的发行版中（如 CentOS 和 Fedora）。它提供了多种功能，包括调整文件系统的大小、检查文件系统状态等 

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
    # 检查 fsadm 命令是否存在
    if ! command -v fsadm &>/dev/null; then
        LOG_WARN "fsadm command is not installed"
        CHECK_RESULT $? 0 0 "fsadm command is required for this test."
    else
		fsadm -h
		CHECK_RESULT $? 
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

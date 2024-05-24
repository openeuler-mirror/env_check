#!/usr/bin/bash
# Create: 2024-05-24 10:08:07
# Auther: wangdong
# 简介: blkid 是一个在 Linux 和 Unix-like 系统中用来获取存储设备信息的实用工具。它能够显示存储设备的 UUID（通用唯一识别码）、文件系统类型、分区表类型等信息。blkid 命令通常用于在系统启动时自动挂载分区，或者在脚本中动态地确定设备名称。

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
    # 检查 blkid 命令是否安装。
    if ! command -v blkid &> /dev/null; then
        LOG_WARN "blkid command is not installed"
        CHECK_RESULT $? 0 0
    fi

    blkid -h
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

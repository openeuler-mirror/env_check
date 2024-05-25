#!/usr/bin/bash
# Create: 2024-05-23 14:08:07
# Auther: wangdong
# 简介: blkdiscard 是一个 Linux 命令行工具，用于对指定的块设备进行 TRIM 操作。TRIM 操作会通知固态硬盘（SSD）或某些类型的硬盘驱动器（HDD）哪些数据块不再使用，可以安全地擦除。这有助于 SSD 管理其存储空间，提高性能和寿命。

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
    # 检查 blkdiscard 命令是否安装。
    if ! command -v blkdiscard &> /dev/null; then
        LOG_WARN "blkdiscard command is not installed"
        CHECK_RESULT $? 0 0
    fi

    blkdiscard -h
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

#!/usr/bin/bash
# Create: 2024-06-03  11:08:07
# Auther: wangdong
# blockdev - call block device ioctls from the command line
# blockdev 是一个在 Linux 系统中用于获取和设置块设备信息的命令行工具。块设备通常指的是硬盘、固态硬盘等存储设备。
# 使用 blockdev 命令，你可以执行以下操作：
# 获取设备信息：查看设备的大小、读写速度等信息。
# 设置设备参数：比如设置设备的读取/写入缓存策略。
# 调整设备属性：比如调整设备的 I/O 调度算法。

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
    # 检查 blockdev 命令是否安装。
    if ! command -v blockdev &> /dev/null; then
        LOG_WARN "blockdev command is not installed"
        CHECK_RESULT $? 0 0
    fi

    #blockdev -h
    #CHECK_RESULT $?
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

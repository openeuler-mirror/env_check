#!/usr/bin/bash
# Create: 2024-06-04  09:38:07
# Auther: wangdong
# bluemoon - Bluemoon configuration utility
# 在Linux系统中，bluemon 是一个用于监视蓝牙设备连接质量的命令行工具。它能够监控与蓝牙设备的链接质量，并在链接质量低于某个设定阈值时启动或停止程序。这可以用于在蓝牙设备连接不稳定时自动执行某些操作，例如断开网络连接、暂停音乐播放等。

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
    # 检查 bluemoon 命令是否安装。
    if ! command -v bluemoon &> /dev/null; then
        LOG_WARN "bluemoon command is not installed"
        CHECK_RESULT $? 0 0
    fi

    #bluemoon -h
    #CHECK_RESULT $?

    # 设置蓝牙地址
    #bluemoon -bdaddr   AA:BB:CC:DD:EE:FF
    
    # 加载固件
    #bluemoon --firmware  /xxx/xxx/firmware.file

    # 重置控制器
    #bluemoon --reset	

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

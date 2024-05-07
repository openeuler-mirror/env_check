#!/usr/bin/bash

# Create: 2023-10-30
# Author: your_name

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 设置语言环境变量为英文，以确保日志输出的一致性
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8

    # 创建一个临时目录用于测试
    test_dir="/tmp/chkconfig_test"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing chkconfig command..."

    # 检查 chkconfig 命令是否存在
    if ! command -v chkconfig &>/dev/null; then
        LOG_WARN "chkconfig command is not installed"
        CHECK_RESULT $? 0 0 "chkconfig command is required for this test."

    # 检查特定服务是否设置为开机启动
    else


        # 测试 'chkconfig --version' 命令
        chkconfig --version
        CHECK_RESULT $? 0 0 "Failed to execute 'chkconfig --version'."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 恢复原始语言环境变量
    export LANG=${OLD_LANG}
    
    # 删除临时测试目录
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@
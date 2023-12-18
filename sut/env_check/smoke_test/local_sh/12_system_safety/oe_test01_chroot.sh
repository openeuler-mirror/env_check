#!/bin/bash

# Create: 2023-12-18
# Author: zengyifeng
# Description: Test script for chroot command.

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
    
    # 创建一个随机命名的测试目录
    test_dir="/tmp/chroot_test_$(date +%s)"
    mkdir -p "$test_dir"
    
    
    # 在测试目录中创建一个文件
    echo "Hello, Chroot!" > "$test_dir/test_file"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 复制 /bin/bash 到测试目录
    cp /bin/bash "$test_dir"
    
    # 使用chroot命令切换到测试目录并执行命令
    #chroot "$test_dir" bin/bash -c "cat test_file"
    chroot / bin/bash -c "cat '$test_dir/test_file'"
    
    # 检查chroot命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute chroot command."
    
    # 测试chroot命令的--help参数
    chroot --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "Failed to execute 'chroot --help'."
    
    # 测试chroot命令的--version参数
    chroot --version
    CHECK_RESULT $? 0 0 "Failed to execute 'chroot --version'."
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除测试目录
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

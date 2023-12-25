#!/bin/bash

# Create: 2023-12-18
# Author: zengyifeng
# Description: Test script for scp command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."

    # 创建一个测试目录，并在其中创建一个测试文件
    test_dir="/tmp/scp_test_$(date +%s)"
    mkdir -p "$test_dir"
    echo "Hello, SCP Test!" > "$test_dir/test_file.txt"

    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 使用 scp 将测试文件复制到本地的另一个目录
    local_dir="/tmp/scp_test_local_$(date +%s)"
    mkdir -p "$local_dir"
    scp "$test_dir/test_file.txt" "$local_dir/"

    # 检查 scp 命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute scp command."

    # 检查本地目录中是否存在复制的文件
    local_file="$local_dir/test_file.txt"
    [ -e "$local_file" ] || CHECK_RESULT $? 0 0 "Local file '$local_file' not found."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."

    # 删除测试目录和本地复制的文件
    rm -rf "$test_dir" "$local_dir"

    LOG_INFO "End to restore the test environment."
}

main $@

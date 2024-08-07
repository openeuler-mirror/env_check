#!/usr/bin/bash

# Describe: This script is used to test the cp command with -v option for verbose copying.


# Create: 2024-5-13
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 获取脚本所在路径
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)


# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个用于测试的源文件
    #local test_source="/tmp/source_file_${current_date_time}.txt"
    test_source="/tmp/source_file1_${current_date_time}.txt"
    echo "Hello, World!" > "$test_source"
    # 定义目标文件
    #local test_target="/tmp/target_file_${current_date_time}.txt"
    test_target="/tmp/target_file2_${current_date_time}.txt"
    LOG_INFO "Test source file has been created at $test_source"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing cp command..."

    # 检查 cp 命令是否存在
    if ! command -v cp &>/dev/null; then
        LOG_ERROR "cp command is not installed."
        CHECK_RESULT 1 0 0 "cp is required for this test."
        return
    fi

    # 使用 cp -v 选项复制文件
    LOG_INFO "Copying the source file to the target file with verbose output..."
    cp -v "$test_source" "$test_target"
    CHECK_RESULT $? 0 0 "Failed to copy file with 'cp -v'."

    # 验证目标文件是否存在
    if [ -f "$test_target" ]; then
        LOG_INFO "The target file has been successfully created at $test_target."
    else
        LOG_ERROR "Failed to find the target file at $test_target."
        CHECK_RESULT 1 0 0 "Target file creation failed."
    fi

    LOG_INFO "Finish test!"
}

function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    #local test_source="/tmp/source_file1_${current_date_time}.txt"
    #local test_target="/tmp/target_file2_${current_date_time}.txt"
    test_source="/tmp/source_file1_${current_date_time}.txt"
    test_target="/tmp/target_file2_${current_date_time}.txt"
    rm -f "$test_source" "$test_target"
    LOG_INFO "End to restore the test environment."
}

# 调用主入口函数
main "$@"


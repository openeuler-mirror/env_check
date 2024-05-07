#!/usr/bin/bash

# Describe: This script demonstrates various uses of chmod for changing file and directory permissions.

# Create: 2023-11-01
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 定义 OET_PATH 为当前脚本所在的目录
OET_PATH=$(cd "$(dirname "$0")" && pwd)

# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个带有时间戳的临时目录用于测试
    test_dir="/tmp/chmod_test_$current_date_time"
    mkdir -p "$test_dir/dir_$current_date_time"
    # 创建测试文件
    touch "$test_dir/dir_$current_date_time/file_$current_date_time"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chmod command..."

    # 测试1: 更改文件权限
    file_path="$test_dir/dir_$current_date_time/file_$current_date_time"
    chmod 644 "$file_path"
    CHECK_RESULT $? 0 0 "Failed to change permissions of $file_path to 644."

    # 测试2: 递归更改目录权限
    chmod -R 755 "$test_dir/dir_$current_date_time"
    CHECK_RESULT $? 0 0 "Failed to recursively change permissions of $test_dir/dir_$current_date_time to 755."

    # 测试3: 设置粘滞位
    chmod +t "$test_dir/dir_$current_date_time"
    CHECK_RESULT $? 0 0 "Failed to add sticky bit to $test_dir/dir_$current_date_time."

    # 验证粘滞位设置
    if [ -w "$test_dir/dir_$current_date_time" ]; then
        LOG_INFO "Sticky bit has been successfully set on $test_dir/dir_$current_date_time."
    else
        LOG_ERROR "Failed to verify the sticky bit on $test_dir/dir_$current_date_time."
        CHECK_RESULT $? 0 0 "Sticky bit verification failed."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除临时测试目录
    sudo rm -rf "$test_dir"
    CHECK_RESULT $? 0 0 "Failed to remove test directory $test_dir."
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
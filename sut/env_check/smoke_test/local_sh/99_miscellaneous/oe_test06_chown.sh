#!/usr/bin/bash

# Create: 2023-11-01
# Author: your_name

# 获取当前日期和时间，格式为 YYYYMMDD-HHMMSS
current_date_time=$(date +"%Y%m%d-%H%M%S")

# 定义 OET_PATH 为当前脚本所在的目录
OET_PATH=$(cd "$(dirname "$0")" && pwd)
# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个带有时间戳的临时目录用于测试
    test_dir="/tmp/chown_test_$current_date_time"
    mkdir -p "$test_dir"
    # 创建一个测试文件
    touch "$test_dir/testfile_$current_date_time.txt"
    # 定义包含时间戳的新的所有者和组，以确保唯一性
    new_owner="newuser_$current_date_time"
    new_group="newgroup_$current_date_time"
    # 创建新的用户和组
    sudo useradd "$new_owner"
    sudo groupadd "$new_group"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chown command..."

    # 使用 chown 更改测试文件的所有者和组
    sudo chown "$new_owner:$new_group" "$test_dir/testfile_$current_date_time.txt"
    CHECK_RESULT $? 0 0 "Failed to change ownership of the test file."

    # 验证更改是否成功
    if ls -l "$test_dir/testfile_$current_date_time.txt" | awk '{print $3":"$4}' | grep -q "^$new_owner:$new_group"; then
        LOG_INFO "Ownership of the test file has been successfully changed to $new_owner:$new_group."
    else
        LOG_ERROR "Failed to verify the ownership change of the test file."
        CHECK_RESULT $? 0 0 "Ownership verification failed."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除临时测试目录
    sudo rm -rf "$test_dir"
    # 删除测试用户和组
    sudo userdel "$new_owner"
    sudo groupdel "$new_group"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
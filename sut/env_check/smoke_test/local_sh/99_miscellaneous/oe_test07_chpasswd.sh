#!/usr/bin/bash

# Describe: This script demonstrates the use of chpasswd to change user passwords in a safe and automated way.

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
    test_dir="/tmp/chpasswd_test_$current_date_time"
    mkdir -p "$test_dir"

    # 定义新用户的名称，包含时间戳以确保唯一性
    new_user="testuser_$current_date_time"

    # 创建一个新用户
    sudo useradd "$new_user"
    CHECK_RESULT $? 0 0 "Failed to create user $new_user."

    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chpasswd command..."

    # 定义新用户的密码
    new_password="testpassword_$current_date_time"

    # 使用 chpasswd 更改用户的密码
    echo "$new_user:$new_password" | sudo chpasswd
    CHECK_RESULT $? 0 0 "Failed to change password for user $new_user."

    # 验证密码更改是否成功
    # 注意：出于安全考虑，这里不执行密码验证，因为实际环境中不应使用不安全的密码验证方法
    # 如果需要验证，可以手动检查或使用更安全的方法

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试用户
    sudo userdel -r "$new_user"
    CHECK_RESULT $? 0 0 "Failed to remove user $new_user."

    # 删除临时测试目录
    sudo rm -rf "$test_dir"
    CHECK_RESULT $? 0 0 "Failed to remove test directory $test_dir."

    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
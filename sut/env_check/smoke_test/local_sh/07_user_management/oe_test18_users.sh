#!/usr/bin/bash

# Create: 2023-10-08

# 获取脚本所在路径
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 生成随机字符串
function generate_random_string() {
    length=${1-8}  # 默认长度为8
    tr -dc A-Za-z0-9 </dev/urandom | head -c "$length"
}

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    
    # 生成带有时间戳的用户名
    timestamp=$(date +%s)
    username="testuser_$timestamp"
    
    # 检查用户是否已存在，如果存在就删除它
    if id "$username" &>/dev/null; then
        userdel "$username"
    fi
    
    # 创建用户
    useradd "$username"
    
    LOG_INFO "Created user: $username"
    LOG_INFO "End to prepare the test environment."
}


# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 尝试切换到测试用户
    su - "$username" -c "echo 'User logged in successfully'"

    # 检查是否包含创建的测试用户
    logged_in_users=$(users)
    echo "$logged_in_users" | grep -q "$username"
    
    # 检查用户是否在登录列表中
    if [ $? -eq 0 ]; then
        LOG_INFO "User $username is found in the list of logged in users."
    else
        LOG_ERROR "User $username is not found in the list of logged in users."
    fi

    # 使用users命令的--help参数查看帮助信息
    users --help | grep -E "Usage:|Options:"
    CHECK_RESULT $? 0 0 "Failed to execute 'users --help'."

    # 使用users命令的--version参数查看版本信息
    users --version
    CHECK_RESULT $? 0 0 "Failed to execute 'users --version'."

    LOG_INFO "Finish test!"
}





# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}

    # 删除测试用户
    userdel -r "$username"

    LOG_INFO "End to restore the test environment."
}

main $@

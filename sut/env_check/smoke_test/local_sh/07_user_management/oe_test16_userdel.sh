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
    random_string=$(generate_random_string)
    username="testuser_${timestamp}_${random_string}"

    # 检查用户是否已存在，如果存在就删除它
    if id "$username" &>/dev/null; then
        userdel -r "$username"
    fi

    # 创建用户
    useradd "$username"

    LOG_INFO "Created user: $username"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 删除测试用户
    userdel -r "$username"

    # 检查userdel命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute userdel command."

    # 检查用户是否已删除
    id "$username" &>/dev/null
    CHECK_RESULT $? 1 0 "User $username still exists after deletion."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}

    LOG_INFO "End to restore the test environment."
}

main $@

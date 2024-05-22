#!/usr/bin/bash

# Describe: This script tests the functionality of the cracklib-check command.

# Create: 2023-11-01
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
    # 如果有需要，可以在这里添加环境准备步骤
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing cracklib-check command..."

    # 检查 cracklib-check 命令是否存在
    if ! command -v cracklib-check &>/dev/null; then
        LOG_ERROR "cracklib-check command is not installed."
        CHECK_RESULT 1 0 0 "cracklib-check is required for this test."
        return
    fi

    # 使用 cracklib-check 检查密码强度
    # 这里使用一个示例密码，您可以根据需要更改
    local test_password="password123"
    LOG_INFO "Testing password strength with cracklib-check..."
    local password_check=$(echo "$test_password" | cracklib-check)
    CHECK_RESULT $? 0 0 "Failed to check password strength with 'cracklib-check'."

    # 打印密码检查结果
    LOG_INFO "Password check result: $password_check"

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 如果有需要，可以在这里添加清理步骤
    LOG_INFO "End to restore the test environment."
}


# 调用主入口函数
main "$@"
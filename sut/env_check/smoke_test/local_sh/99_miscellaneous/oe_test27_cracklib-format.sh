#!/usr/bin/bash

# Describe: This script tests the functionality of the cracklib-format command.

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
    # 创建一个示例密码文件
    test_password_file="/tmp/test_passwords_${current_date_time}.txt"
    echo "password123" > "$test_password_file"
    echo "testpassword" >> "$test_password_file"
    LOG_INFO "Test password file has been created at $test_password_file"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing cracklib-format command..."

    # 检查 cracklib-format 命令是否存在
    if ! command -v cracklib-format &>/dev/null; then
        LOG_ERROR "cracklib-format command is not installed."
        CHECK_RESULT 1 0 0 "cracklib-format is required for this test."
        return
    fi

    # 使用 cracklib-format 生成字典文件
    dictionary_file="/tmp/cracklib_dictionary_${current_date_time}.txt"
    cracklib-format -o "$dictionary_file" "$test_password_file"
    #cracklib-format "$dictionary_file" "$test_password_file"
    CHECK_RESULT $? 0 0 "Failed to generate dictionary file with 'cracklib-format'."

    # 验证字典文件是否存在
    #if [ -f "$dictionary_file" ]; then
    #    LOG_INFO "Dictionary file has been successfully created at $dictionary_file."
    #else
    #    LOG_ERROR "Failed to create dictionary file."
    #    CHECK_RESULT 1 0 0 "Dictionary file creation failed."
    #fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    test_password_file="/tmp/test_passwords_${current_date_time}.txt"
    dictionary_file="/tmp/cracklib_dictionary_${current_date_time}.txt"
    rm -f "$test_password_file" "$dictionary_file"
    LOG_INFO "End to restore the test environment."
}


# 调用主入口函数
main "$@"
#!/usr/bin/bash

# Describe: This script is used to generate a CrackLib dictionary file using the create-cracklib-dict command.

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
    local test_password_file="/tmp/test_passwords_${current_date_time}.txt"
    echo "password123" > "$test_password_file"
    echo "testpassword" >> "$test_password_file"
    LOG_INFO "Test password file has been created at $test_password_file"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing create-cracklib-dict command..."

    # 检查 create-cracklib-dict 命令是否存在
    if ! command -v create-cracklib-dict &>/dev/null; then
        LOG_ERROR "create-cracklib-dict command is not installed."
        CHECK_RESULT 1 0 0 "create-cracklib-dict is required for this test."
        return
    fi

    # 使用 create-cracklib-dict 生成字典文件
    local dictionary_file="/tmp/cracklib_dictionary_${current_date_time}.txt"
    create-cracklib-dict -o "$dictionary_file" "$test_password_file"
    CHECK_RESULT $? 0 0 "Failed to generate dictionary file with 'create-cracklib-dict'."



    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    local test_password_file="/tmp/test_passwords_${current_date_time}.txt"
    local dictionary_file="/tmp/cracklib_dictionary_${current_date_time}.txt"
    rm -f "$test_password_file" "$dictionary_file"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
#function main() {
#    pre_test
#    run_test
#    post_test
#}
# 这种情况及时脚本错误也会显示执行结果为0，根本不能生成正常的日志文件

# 调用主入口函数
main "$@"
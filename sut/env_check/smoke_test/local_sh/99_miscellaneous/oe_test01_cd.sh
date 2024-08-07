#!/usr/bin/bash

# Create: 2024-04-25
# Author: zengyifeng

# 获取脚本所在路径
SCRIPT_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)

# 导入通用库函数
source "$SCRIPT_PATH/../../common/common_lib.sh"

# 添加当前日期和时间到测试目录名称中以增加随机性
current_date_time=$(date +%Y%m%d%H%M%S)
test_dir="/tmp/test_cd_command_$current_date_time"

# Environment setup
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个带有当前日期和时间的测试目录
    mkdir -p "$test_dir"
    LOG_INFO "End to prepare the test environment."
}

# Test execution
function run_test() {
    LOG_INFO "Start testing the 'cd' command..."

    # 检查 cd 命令是否存在
    if ! command -v cd &> /dev/null; then
        LOG_ERROR "'cd' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "cd command check failed."
        return
    else
        LOG_INFO "'cd' command is available."
    fi

    # 尝试切换到带日期时间的测试目录
    cd "$test_dir" && {
        LOG_INFO "Successfully changed directory to $test_dir using 'cd'."
        CHECK_RESULT $? 0 0 "Changing directory succeeded."
    } || {
        LOG_ERROR "Failed to change directory to $test_dir using 'cd'."
        CHECK_RESULT $? 0 0 "Changing directory failed."
    }

    LOG_INFO "Finish test!"
}

# Environment cleanup
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试目录
    rm -rf "$test_dir"
    LOG_INFO "End to restore the test environment."
}

# 主函数，协调测试流程
#function main() {
#    pre_test
#    run_test
#    post_test
#}

# 执行主函数，并将脚本的参数传递给主函数
main "$@"
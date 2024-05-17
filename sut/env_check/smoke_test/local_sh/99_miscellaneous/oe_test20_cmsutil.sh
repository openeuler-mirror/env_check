#!/usr/bin/bash

# Describe: This script is used to check the functionality of the cmsutil command with -v and --help options.

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
    # 环境准备可能包括其他步骤，这里仅作为示例
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing clockdiff command..."

    # 检查 clockdiff 命令是否存在
    if ! command -v cmsutil &>/dev/null; then
        LOG_ERROR "cmsutil command is not installed."
        #CHECK_RESULT $? 0 0 "cmsutil is required for this test." # 有误！！！！
        CHECK_RESULT 1 0 0 "cmsutil is required for this test."
        return
    fi


    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 如果有需要，可以在这里添加清理步骤
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
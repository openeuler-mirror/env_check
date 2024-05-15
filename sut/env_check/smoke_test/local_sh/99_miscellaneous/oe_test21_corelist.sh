#!/usr/bin/bash

# Describe: .

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

    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing corelist command "
    
    # 检查 clockdiff 命令是否存在
    if ! command -v corelist &>/dev/null; then
        LOG_ERROR "corelist command is not installed."

        CHECK_RESULT 1 0 0 "corelist is required for this test."
        return
    fi

    corelist
    CHECK_RESULT $? 0 0 "Failed to execute 'corelist'."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."

    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
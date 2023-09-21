#!/usr/bin/bash -x

# Create: 2023-09-16

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"
# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End to prepare the test environment."
}


# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 使用grpunconv命令
    grpunconv
    
    # 检查grpunconv命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute grpunconv command."

    # 使用grpconv命令更新组文件
    grpconv
    
    # 检查grpconv命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute grpconv command."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
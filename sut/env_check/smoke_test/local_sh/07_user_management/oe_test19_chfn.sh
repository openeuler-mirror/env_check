#!/usr/bin/bash

# Create: 2023-10-17

# 获取脚本所在路径
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

    # check whether chfn is or not installed
    if ! command -v chfn &> /dev/null; then
        LOG_WARN "chfn command is not installed"
        CHECK_RESULT $? 0 0
    fi


    LOG_INFO "Finish test!"
}





# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

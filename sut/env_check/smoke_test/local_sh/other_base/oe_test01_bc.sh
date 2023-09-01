#!/usr/bin/bash
# Create: 2023-08-30 11:18:07
# Auther: hebinxin
# Description: A shellscript to check bc(a calculator for accurate calculations) command.

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
    # check whether bc is installed or not
    if ! command -v bc &> /dev/null; then
        yum install -y bc
    fi
    # check add
    echo "2+2" | bc &> /dev/null
    CHECK_RESULT $?
    # check bc help
    bc --help | grep -E "usage|用法"
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

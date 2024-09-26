#!/usr/bin/bash
# Create: 2023-09-22 17:57:25
# Auther: hebinxin
# Description: A shellscript to check md5sum command.

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
    # check md5sum
    md5sum ./oe_test13_md5sum.sh | awk -F " " '{print $1}'
    CHECK_RESULT $? 0 0 "md5sum cp error"
    # check md5sum --help
    md5sum --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "md5sum --help error"
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

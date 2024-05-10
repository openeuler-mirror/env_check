#!/usr/bin/bash
# Create: 2024-05-09 09:15:12
# Auther: hebinxin
# Description: A shellscript to check autom4te command.

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

    # 1. test autom4te -version
    autom4te --version
    CHECK_RESULT $? 0 0 "autom4te --version error"

    # 2. test autom4te --help
    autom4te --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "autom4te --help error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    [ -e "$cfg_file" ] && rm -ff $cfg_file
    [ -e "$m4_file" ] && rm -rf $m4_file
    LOG_INFO "End to restore the test environment."
}

main $@


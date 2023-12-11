#!/usr/bin/bash
# Create: 2023-12-06 16:23:54
# Auther: hebinxin
# Description: A shellscript to check lsattr command.

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
    file=$OET_PATH/oe_test08.txt
    [ -e "$file" ] && rm -f $file
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    touch $file

    # 1. test lsattr 
    lsattr $file
    CHECK_RESULT $? 0 0 "lsattr error"

    # 2. test lsattr -d
    lsattr -d $OET_PATH
    CHECK_RESULT $? 0 0 "lsattr -d error"

    LOG_INFO "Finish test!"
}

环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    file=$OET_PATH/oe_test08.txt
    [ -e "$file" ] && rm -f $file
    LOG_INFO "End to restore the test environment."
}

main $@


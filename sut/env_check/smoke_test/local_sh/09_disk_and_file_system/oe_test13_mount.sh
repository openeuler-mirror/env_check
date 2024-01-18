#!/usr/bin/bash
# Create: 2023-12-27 09:34:55
# Auther: hebinxin
# Description: A shellscript to check mount command.

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
    file=$OET_PATH/oe_test12.sh
    [ -e "$file" ] && rm -f $file
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    mount -V
    CHECK_RESULT $? 0 0 "mount -V error"

    mount -h | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "mount --help error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    [ -e "$file" ] && rm -f $file
    [ -e "$TMPFILE" ] && rm -rf $TMPFILE
    LOG_INFO "End to restore the test environment."
}

main $@


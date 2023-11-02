#!/usr/bin/bash
# author: wangdong
# Create: 2023-11-02  10:40
# Description: test the ispell command -- used for spell checking

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
    which ispell
    CHECK_RESULT $?

    echo "Th is a dog!" >> /tmp/testfile
    ispell /tmp/testfile
    CHECK_RESULT $?
    cat /tmp/testfile

    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -r /tmp/testfile
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2023-11-02  11:10
# Description: test the jed command -- 

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
    which jed
    CHECK_RESULT $?

    echo "This is a dog!" >> /tmp/testfile
    timeout 2 jed /tmp/testfile
    CHECK_RESULT $?

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

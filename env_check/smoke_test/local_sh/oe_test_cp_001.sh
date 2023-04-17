#!/usr/bin/bash

# Create: 2023-04-17

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../common/common_lib.sh"
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
    ls test01 || touch test01
    ls /tmp/test01 && rm -rf /tmp/test01
    cp test01 /tmp
    ls /tmp/test01
    CHECK_RESULT $?
    # check cp
    ls test02/test03 || mkdir -p test02/test03
    ls /tmp/test02 && rm -rf /tmp/test02
    cp -r test02 /tmp
    ls /tmp/test02
    CHECK_RESULT $?
    # check cp help
    cp --help | grep -E "Usage|用法"
    CHECK_RESULT $?
    ls /tmp/test4 && rm -rf /tmp/test4
    cp -s test01 test4
    CHECK_RESULT $?
    ls -l test4 | grep "test4 -> test01"
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf test01 test02 /tmp/test01 /tmp/test02 test4
    LOG_INFO "Finish environment cleanup!"
}

main $@

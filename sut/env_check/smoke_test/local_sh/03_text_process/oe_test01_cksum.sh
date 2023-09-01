#!/usr/bin/bash

# Create: 2023-08-31

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

    # check cksum
    mkdir /tmp
    touch /tmp/test.txt

    echo "12345678" >> /tmp/test.txt
    cksum test.txt
    CHECK_RESULT $?

    # check cp help
    cksum --help | grep -E "Usage|用法"
    CHECK_RESULT $?

    cksum -q /tmp/test.txt
    CHECK_RESULT $?

    cksum -c test.txt
    CHECK_RESULT $?

    echo "abcdefg" >> /tmp/test2.txt
    cksum  test.txt  /tmp/test2/txt
    CHECK_RESULT $?

    cksum test.txt > /tmp/cksum.log
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/test.txt   /tmp/test2.txt  /tmp/cksum.log
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2023-12-07  14:30
# Description: test the sort command -- sort lines of text files

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
    echo "Start test!"

    which sort
    CHECK_RESULT $?

    echo "zhangsan  80" >> /tmp/testfile001
    echo "lisi      70" >> /tmp/testfile001
    echo "wangwu    90" >> /tmp/testfile001
    echo "zhanghua  98" >> /tmp/testfile001
    echo "liuwei    50" >> /tmp/testfile001
    echo "wanglei   78" >> /tmp/testfile001

	cat /tmp/testfile001
    CHECK_RESULT $?

	sort /tmp/testfile001
    CHECK_RESULT $?

	sort -k2 /tmp/testfile001
    CHECK_RESULT $?

    echo "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -r /tmp/testfile001
    LOG_INFO "Finish environment cleanup!"
}

main $@

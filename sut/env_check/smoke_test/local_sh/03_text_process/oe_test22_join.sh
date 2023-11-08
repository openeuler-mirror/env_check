#!/usr/bin/bash
# author: wangdong
# Create: 2023-11-8  15:30 
# Description: test the join command -- join lines of two files on a common field

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

    # check cksum
    mkdir -p /tmp/tmp

    touch /tmp/tmp/test1.txt
	data1="zhangsan 80\nlisi 70"
    echo -e "$data1" > /tmp/tmp/test1.txt
    CHECK_RESULT $?


    touch /tmp/tmp/test2.txt
	data2="zhangsan 90\nlisi 60"
    echo -e "$data2" > /tmp/tmp/test2.txt
	join /tmp/tmp/test1.txt   /tmp/tmp/test2.txt
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/tmp
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2023-12-28  15:30
# Description: test the uniq command -- report or omit repeated lines

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
    which uniq
    CHECK_RESULT $?

    cd /tmp/
    echo "This is a dog!" >> /tmp/testfile001
    echo "I love Linux!" >> /tmp/testfile001
    echo "I love China!" >> /tmp/testfile001
    echo "I love Cmcc!" >> /tmp/testfile001
    echo "I love Suzhou!" >> /tmp/testfile001
    echo "I love Linux!" >> /tmp/testfile001
    echo "I love SND!" >> /tmp/testfile001
    echo "I love Family!" >> /tmp/testfile001
    echo "I love BeiJing!" >> /tmp/testfile001
    echo "I love SND!" >> /tmp/testfile001
    #cat  /tmp/testfile001

	sort /tmp/testfile001 | uniq -c	# 排序并删除重复行，显示重复的次数
    CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/testfile001
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2024-1-4  11:30
# Description: test the wc command -- print newline, word, and byte counts for each file

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

	#test1
    which wc
    CHECK_RESULT $?

	#test2
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

	wc /tmp/testfile001	# 统计文件的信息
    CHECK_RESULT $?

	#test3
	ps -aux | wc -l # 统计ps命令的输出行数
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

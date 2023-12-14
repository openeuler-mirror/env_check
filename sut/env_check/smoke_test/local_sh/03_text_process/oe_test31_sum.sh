#!/usr/bin/bash
# author: wangdong
# Create: 2023-12-14  10:30
# Description: test the sum command -- checksum and count the blocks in a file

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
    which sum
    CHECK_RESULT $?

    cd /tmp/
    echo "This is a dog!" >> /tmp/testfile001
    echo "I love Linux!" >> /tmp/testfile001
    echo "I love China!" >> /tmp/testfile001
    echo "I love Cmcc!" >> /tmp/testfile001
    echo "I love Suzhou!" >> /tmp/testfile001
    echo "I love SND!" >> /tmp/testfile001
    sum  /tmp/testfile001
    CHECK_RESULT $?

	echo "1" >> /tmp/testfile001	#将1追加到testfile001文件最后
	sum /tmp/testfile001	#计算发生改变的文件的校验和
    CHECK_RESULT $?
    echo "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/testfile001
    LOG_INFO "Finish environment cleanup!"
}

main $@

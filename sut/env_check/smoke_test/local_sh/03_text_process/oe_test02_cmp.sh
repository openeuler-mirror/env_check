#!/usr/bin/bash
# Create: 2023-09-01 15:43:30
# Auther: wangdong
# Description: A shellscript to check cmp(compare tool) command.

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

    #text
    echo "abcdefg" > /tmp/file1.txt
    echo "123456" > /tmp/file2.txt

    cmp -s file1.txt file2.txt

    if [ $? -eq 0 ]; then
        echo "file1 is the same with file2"
    else
	echo "file 2 is not same with file2"
    fi	

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    #clean
    rm /tmp/file1.txt  /tmp/file2.txt
    LOG_INFO "End to restore the test environment."
}

main $@

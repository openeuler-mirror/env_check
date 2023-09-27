#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-08  17:10 
# Description: test the command colrm - remove columns from a file

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

    echo  "Start testing..."

    #基本用法：删除输入字符串的第6个字符及其后的字符，输出为"12345 "。
    echo "12345 67890" | colrm 6

    #删除多个字符：删除输入字符串中第3到第7个字符，输出为"abghij"。
    echo "abcdefghij" | colrm 3 7

    #删除空白字符:删除输入字符串中的前4个字符，输出为"This is a test "。
    echo "  This is a test  " | colrm 1 4

    #删除字符串的末尾：
    echo "abcdefg" | colrm 4 100

    #多行文本：
    echo "this if line1." > textfile.txt
    echo "this if line2." > textfile.txt
    echo "this if line3." > textfile.txt
    colrm 1 5 < textfile.txt

    #删除特定列的字符：删除输入字符串的第3和第4个字符，输出为"125 67890"。
    echo "12345 67890" | colrm 3 4

    #处理空输入：
    echo "" | colrm 2

    #删除所有字符：
    echo "hello" | colrm 1 100

    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf testfile.txt
    LOG_INFO "Finish environment cleanup!"
}

main $@

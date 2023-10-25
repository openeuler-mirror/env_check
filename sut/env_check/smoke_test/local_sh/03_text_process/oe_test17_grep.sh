#!/usr/bin/bash
# author: wangdong
# Create: 2023-10-25  10:40
# Description: test the grep/egrep/fgrep command -- print lines matching a pattern

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
    #test1 在文件/etc/passwd中搜索含有root的行
    grep root  /etc/passwd
    CHECK_RESULT $?	

    #test2 在文件/etc/passwd中搜索不含有root的行
    grep -v root  /etc/passwd
    CHECK_RESULT $?	

    #test3 在文件/etc/passwd中搜索以bash结尾的行
    grep bash$ /etc/passwd
    CHECK_RESULT $?	

    #test4 在文件/etc/passwd中搜索以root开头的行
    grep ^root   /etc/passwd
    CHECK_RESULT $?

    #test5
    echo "banana" >> /tmp/test.txt
    echo "Hello, liyinghe" >> /tmp/test.txt
    echo "apple" >> /tmp/test.txt

    fgrep "apple" /tmp/test.txt
    CHECK_RESULT $?

    grep -i "Test" /tmp/test.txt
    CHECK_RESULT $?

    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -r /tmp/test.txt	
    LOG_INFO "Finish environment cleanup!"
}

main $@

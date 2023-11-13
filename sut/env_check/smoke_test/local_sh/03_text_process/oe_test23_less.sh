#!/usr/bin/bash

#Test less command --Less  is a program similar to more, but which allows backward movement in the file as well as forward movement.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"
# 环境准备
function pre_test() {
    LOG_INFO "Start environment preparation."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    ls /tmp/test1 && rm -rf /tmp/test1
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing......"
    mkdir -p /tmp/test1/
   
    #test1
    timeout 2 less /etc/passwd
    echo $? 

    #test2
    timeout 2 less /var/log/messages
    echo $?

    #test3
    which less
    echo $? 

    #test4
    touch /tmp/test1/file1
    echo "123456" > /tmp/test1/file1
    timeout 2 less /tmp/test1/file1
    echo $? 

    #test5
    less --help | grep -E "Usage|用法"
    echo $? 

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -rf /tmp/test1
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

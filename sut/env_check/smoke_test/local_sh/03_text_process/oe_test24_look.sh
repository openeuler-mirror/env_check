#!/usr/bin/bash

#Test look command -- display lines beginning with a given string

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
    sort /etc/passwd > /tmp/test1/passwd.sorted
	look root  /tmp/test1/passwd.sorted
    echo $? 

    #test2
	look rpc  /tmp/test1/passwd.sorted
    echo $?

    #test3
    which look
    echo $? 

    #test4
	ls -al /usr/bin/look
    echo $? 

    #test5
    look --help | grep -E "Usage|用法"
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

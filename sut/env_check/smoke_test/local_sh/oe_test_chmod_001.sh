#!/usr/bin/bash


OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../common/common_lib.sh"
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
    mkdir -p /tmp/test1/test2/test3
    ls -l /tmp | grep "test1" | awk -F ' ' '{print $1}' | grep "drwxr-xr-x"
    CHECK_RESULT $?
    per01=$(ls -l /tmp/test1 | grep "test2" | awk -F ' ' '{print $1}')
    #check chmod
    chmod 777 /tmp/test1
    ls -l /tmp | grep "test1" | awk -F ' ' '{print $1}' | grep "drwxrwxrwx"
    CHECK_RESULT $?
    per02=$(ls -l /tmp/test1 | grep "test2" | awk -F ' ' '{print $1}')
    [ "$per01" == "$per02" ]
    CHECK_RESULT $?
    # check chmod -R
    chmod -R 777 /tmp/test1
    ls -l /tmp/ | grep "test1" | awk -F ' ' '{print $1}' | grep "drwxrwxrwx"
    CHECK_RESULT $?
    ls -l /tmp/test1 | grep "test2" | awk -F ' ' '{print $1}' | grep "drwxrwxrwx"
    CHECK_RESULT $?
    #check chmod help
    chmod --help | grep -E "Usage|用法"
    CHECK_RESULT $?
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

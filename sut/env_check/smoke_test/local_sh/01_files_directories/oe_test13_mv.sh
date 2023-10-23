#!/usr/bin/bash


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
    mkdir -p /tmp/test1/test2/test3
    touch /tmp/test1/test2/test3/file{1,2,3,4,5}
    mv /tmp/test1/test2/test3 /tmp/test1/
    CHECK_RESULT $?
    test -e /tmp/test1/test3
    CHECK_RESULT $?

    mv  /tmp/test1/test3/file[1-5] /tmp/test1/test2/
    CHECK_RESULT $?
    test -e /tmp/test1/test2/file3
    CHECK_RESULT $?
    
    mv --help | grep -E "Usage|用法"
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

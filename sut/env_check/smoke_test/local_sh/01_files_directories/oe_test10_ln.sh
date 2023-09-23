#!/usr/bin/bash

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
    ls test01 || touch test01
    ln test01 hardlink2test01
    CHECK_RESULT $?
    nodenum1=`ls -i test01 | awk '{print $1}'`
    nodenum2=`ls -i hardlink2test01 | awk '{print $1}'`
    test $nodenum1 == $nodenum2
    CHECK_RESULT $?
    mkdir testdir
    ln -s testdir softlink2testdir
    CHECK_RESULT $?
    ln --help | grep -E "Usage|用法"
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    rm -fr test01 hardlink2test01 softlink2testdir testdir
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# Create: 2024-04-08 14:44:53
# Auther: hebinxin
# Description: A shellscript to check aclocal command. 

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
    cfg_file=$OET_PATH/configure.ac
    m4_file=$OET_PATH/autom4te.cache
    [ -e "$cfg_file" ] && rm -f $cfg_file
    [ -e "$m4_file" ] && rm -f $m4_file
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    ### Generate 'aclocal.m4' by scanning 'configure.ac' or 'configure.in'###

    # 1. test aclocal
    touch $cfg_file
    pushd $OET_PATH
    aclocal 
    popd

    CHECK_RESULT $? 0 0 "aclocal error"

    # 2. test aclocal -version
    aclocal --version
    CHECK_RESULT $? 0 0 "aclocal --version error"

    # 3. test aclocal --help
    aclocal --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "aclocal --help error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    [ -e "$cfg_file" ] && rm -rf $cfg_file
    [ -e "$m4_file" ] && rm -rf $m4_file
    LOG_INFO "End to restore the test environment."
}

main $@

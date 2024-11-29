#!/usr/bin/bash
# Create: 2024-11-25 15:36:52
# Auther: hebinxin
# Description: A shellscript to check cc command.

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
    demo_c=$OET_PATH/test_cc.c
    demo=$OET_PATH/test_cc
    [ -e "$demo_c" ] && rm -f $demo_c
    [ -e "$demo" ] && rm -f $demo
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    if ! command -v cc &> /dev/null; then
        LOG_WARN "cc command is not installed."
        CHECK_RESULT $? 0 0
    else
        touch $demo_c
        cat << EOF > $demo_c
#include <stdio.h>

int main()
{
    printf("Hello World!\n");
    return 0;
}
EOF
        # test cc -o
        cc $demo_c -o $demo
        CHECK_RESULT $? 0 0 "cc -o error"
        output=$($demo)
        if [ $output != "Hello World!" ]; then
            CHECK_RESULT $? 0 0 "cc error"
        fi
        # test cc -v
        cc -v
        CHECK_RESULT $? 0 0 "cc -v error"
        # test cc --help
        cc --help | grep -E "Usage|用法"
        CHECK_RESULT $? 0 0 "cc --help error"
        LOG_INFO "Finish test!"
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    [ -e "$demo_c" ] && rm -f $demo_c
    [ -e "$demo" ] && rm -f $demo
    LOG_INFO "End to restore the test environment."

}

main $@


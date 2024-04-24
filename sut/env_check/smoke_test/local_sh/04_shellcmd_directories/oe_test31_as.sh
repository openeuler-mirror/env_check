#!/usr/bin/bash
# Create: 2024-04-24 09:16:43
# Auther: hebinxin
# Description: A shellscript to check as command.

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
    demo_c=$OET_PATH/demo.c
    demo_s=$OET_PATH/demo.s
    demo_o=$OET_PATH/demo.o
    demo=$OET_PATH/demo
    [ -e "$demo_c" ] && rm -f $demo_c
    [ -e "$demo_s" ] && rm -f $demo_s
    [ -e "$demo_o" ] && rm -f $demo_o
    [ -e "$demo" ] && rm -f $demo
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    ### as is typically used to assemble source code files and generate target files  ###
    touch $demo_c
    cat << EOF > $demo_c
#include <stdio.h>

int main()
{
    printf("Hello World!\n");
    return 0;
}
EOF

    # 1. test as -o
    gcc -S $demo_c -o $demo_s
    as -o $demo_o $demo_s
    gcc -o $demo $demo_o

    pushd $OET_PATH
    basebame=$(basename $demo)
    output=$(./$basebame)
    [ "$output" == "Hello World!" ] # 因为output中有空格，所以要加双引号

    CHECK_RESULT $? 0 0 "as -o error"
    popd

    # 2. test as --help
    as --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "as --help error"
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    demo_c=$OET_PATH/demo.c
    demo_s=$OET_PATH/demo.s
    demo_o=$OET_PATH/demo.o
    demo=$OET_PATH/demo
    [ -e "$demo_c" ] && rm -f $demo_c
    [ -e "$demo_s" ] && rm -f $demo_s
    [ -e "$demo_o" ] && rm -f $demo_o
    [ -e "$demo" ] && rm -f $demo
    LOG_INFO "End to restore the test environment."
}

main $@
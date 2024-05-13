#!/usr/bin/bash
# Create: 2024-05-13 09:35:52
# Auther: hebinxin
# Description: A shellscript to check autrace command.

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
    demo_c=$OET_PATH/autrace.c
    demo=$OET_PATH/autrace
    [ -e "$demo_c" ] && rm -f $demo_c
    [ -e "$demo" ] && rm -f $demo
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    touch $demo_c
    cat << EOF > $demo_c
#include <stdio.h>

int main()
{
    printf("Hello World!\n");
    return 0;
}
EOF
    gcc $demo_c -o $demo
    autrace $demo
    CHECK_RESULT $? 0 0 "autrace error"
    LOG_INFO "Finish test!"
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


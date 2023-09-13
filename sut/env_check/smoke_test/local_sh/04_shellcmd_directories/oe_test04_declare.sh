#!/usr/bin/bash -x

# Create: 2023-09-01

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
    declare
    CHECK_RESULT $?
    declare my_var1="hello"
    CHECK_RESULT $?
    declare my_var2=100+200
    CHECK_RESULT $?
    declare -p my_var1 my_var2
    CHECK_RESULT $?
    declare my_var="I'm fine!"
    CHECK_RESULT $?
    declare -x my_var
    CHECK_RESULT $?
    declare -x 
    CHECK_RESULT $?
    declare +x my_var
    CHECK_RESULT $?
    declare -x 
    CHECK_RESULT $?    
    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

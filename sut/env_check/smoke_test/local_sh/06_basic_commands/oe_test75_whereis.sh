#!/usr/bin/bash
# Create: 2024-10-12 
# Auther: gaoyanjun
# Description: A shellscript to check whereis command.

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
    
    # check whereis
    msg=$(whereis vi)
    CHECK_RESULT $? 0 0 "whereis vi error"
    
    # chech -b 
    msg=$(whereis -b vi | grep vi )
    CHECK_RESULT $? 0 0 "whereis -b vi error"
    
    # check -m 
    msg=$(whereis -m vi | grep vi.1.gz)
    CHECK_RESULT $? 0 0 "whereis -m vi error"
    
    # check -s
    #msg=$(whereis -s vi)
    #CHECK_RESULT $? 0 1 " vi source not found"

    # chech -u
    msg=$(whereis -u vi)
    CHECK_RESULT $? 0 0 "whereis -u vi error" 
    
    # check --help 
    msg=$(whereis --help | grep -E "Usage|用法")
    CHECK_RESULT $? 0 0 "whereis --help error"
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main$@

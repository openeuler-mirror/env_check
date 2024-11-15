#!/usr/bin/bash
# Create: 2024-9-24
# Auther: gaoyanjun
# Description: A shellscript to check which command.

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
    
    # check which 
    which ls
    CHECK_RESULT $? 0 0 "which ls error"

    # check which -a 
    which -a ls
    CHECK_RESULT $? 0 0 "which -a ls error"

    # check which -s 
    which -s ls
    CHECK_RESULT $? 0 0 "which -s ls error"

    # check which -m 
    which -m ls
    CHECK_RESULT $? 0 0 "which -m ls error"

    # check  which --help
    which --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "which --help error"

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

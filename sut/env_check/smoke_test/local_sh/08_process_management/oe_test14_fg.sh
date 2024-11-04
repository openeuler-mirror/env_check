#!/usr/bin/bash -x

# Create: 2024-11-04
# Auther: wangbo
# build-locale-archive

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
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {
LOG_INFO "Start testing fg..."

    sleep 10 &
    bg_pid=$!
    fg %1
    CHECK_RESULT $? 0 0 "fg bring single background job to foreground error"

    sleep 10 &
    sleep 20 &
    sleep 30 &
    fg %1
    CHECK_RESULT $? 0 0 "fg bring first background job to foreground error"
    fg %2
    CHECK_RESULT $? 0 0 "fg bring second background job to foreground error"
    fg %3
    CHECK_RESULT $? 0 0 "fg bring third background job to foreground error"

    fg
    CHECK_RESULT $? 1 0 "current: no such job"

    LOG_INFO "Finish testing fg!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
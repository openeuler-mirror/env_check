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
    ls /tmp/test1 && rm -f /tmp/test1
    ls /tmp/test1 && rm -f /tmp/test2
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing......"
    touch /tmp/test1
    CHECK_RESULT $?

    touch /tmp/test2 -t 2303121945
    CHECK_RESULT $?

    year=` ls -l /tmp/test2 | awk '{print $8}'`
    test $year == "2023"
    CHECK_RESULT $?

    month=` ls -l /tmp/test2 | awk '{print $6}'`
    test $month == "Mar"
    CHECK_RESULT $?

    day=` ls -l /tmp/test2 | awk '{print $7}'`
    test $day == "12"
    CHECK_RESULT $?

    touch --help | grep -E "Usage|用法"
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -f /tmp/test1
    rm -f /tmp/test2
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

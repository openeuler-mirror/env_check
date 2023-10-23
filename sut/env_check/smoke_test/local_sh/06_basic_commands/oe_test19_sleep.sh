#!/usr/bin/bash
# Create: 2023-10-23 11:02:48
# Auther: hebinxin
# Description: A shellscript to check sleep command.

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
    # check sleep 3
    date1=$(date +"%Y-%m-%d %H:%M:%S")
    sleep 3 # 延时3秒
    date2=$(date +"%Y-%m-%d %H:%M:%S")
    # 将时间转化为系统时间
    sys_date1=$(date -d "$date1" +%s)
    sys_date2=$(date -d "$date2" +%s)
    # 计算差值
    delta_sec=`expr $sys_date2 - $sys_date1`
    [ $delta_sec == 3 ]
    CHECK_RESULT $? 0 0 "sleep error"
    # check sleep --help
    sleep --help 
    CHECK_RESULT $? 0 0 "sleep error"
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

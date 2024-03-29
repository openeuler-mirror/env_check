#!/usr/bin/bash
# author: wangdong
# Create: 2024-3-26  14:00
# Description: test the accept command -- accept/reject jobs sent to a destination

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
    echo "Start test!"

    which accept
    CHECK_RESULT $?

    rpm -qf /usr/sbin/accept
    CHECK_RESULT $?

    #accept hp_printer   # 允许向指定打印机hp_printer发送任务
    #CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

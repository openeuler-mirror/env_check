#!/usr/bin/bash
# author: wangdong
# Create: 2024-3-28  17:00
# Description: test the cancel command -- cancel jobs

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

    which cancel
    CHECK_RESULT $?
    
    rpm -qf /usr/bin/cancel
    CHECK_RESULT $?

    lpq			# 显示打印队列
    CHECK_RESULT $?

    cancel 2		# 取消队列中的2号任务
    CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

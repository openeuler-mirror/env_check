#!/usr/bin/bash
# Create: 2024-02-02 14:39:02
# Auther: hebinxin
# Description: A shellscript to check ipcalc command.

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

    # 1. test ipcalc -b : show broadcast address according to the inputting ip address and net mask
    ipcalc -b 192.168.3.3/24
    CHECK_RESULT $? 0 0 "ipcalc -b error"

    # 2. test ipcalc -h : show hostname according to ip
    ipcalc -h 127.0.0.1
    CHECK_RESULT $? 0 0 "ipcalc -h error"

    # 3. test ipcalc -m : caculate the net mask by provided ip addr
    ipcalc -m 192.168.3.3/24
    CHECK_RESULT $? 0 0 "ipcalc -m error"

    # 4. test ipcalc --help
    ipcalc --help
    CHECK_RESULT $? 0 0 "ipcalc --help error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
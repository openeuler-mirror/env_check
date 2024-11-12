#!/usr/bin/bash -x

# Create: 2024-11-12
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

    LOG_INFO "Start testing last..."

    last > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last failed to display recent login records"

    last -n 5 > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -n 5 failed to limit output to 5 records"

    last -x > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -x failed to show shutdown, reboot, and runlevel changes"

    last -a > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -a failed to display hostname in the last column"

    last -F > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -F failed to display full date and timestamp"

    last -R > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -R failed to suppress hostname display"

    last -w > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -w failed to display full user and terminal information"

    last -t 2023-01-01 > /tmp/last_output.txt
    CHECK_RESULT $? 0 0 "last -t 2023-01-01 failed to limit output to records before the specified date"

    LOG_INFO "Finish testing last!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -f /tmp/last_output.txt
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
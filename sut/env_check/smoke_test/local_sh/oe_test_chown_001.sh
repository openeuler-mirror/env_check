#!/usr/bin/bash

# Copyright: Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
# Create: 2023-02-09

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../common/common_lib.sh"
NODE_PASSWORD="cnp200@HW"
# 环境准备
function pre_test() {
    LOG_INFO "Start environment preparation."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    grep "test:" /etc/passwd && userdel -rf test
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    useradd test
    echo "${NODE_PASSWORD}" | passwd test --stdin

    mkdir -p /tmp/tmp/tmp01

    [ $(ls -l /tmp/tmp | tail -n 1 | awk -F ' ' '{print $3}') == "root" ]
    CHECK_RESULT $?
    [ $(ls -l /tmp/tmp | tail -n 1 | awk -F ' ' '{print $4}') == "root" ]
    CHECK_RESULT $?
    # check chown
    chown -R test:test /tmp/tmp
    CHECK_RESULT $?
    own_user2=$(ls -l /tmp/tmp | tail -n 1 | awk -F ' ' '{print $3}')
    own_group2=$(ls -l /tmp/tmp | tail -n 1 | awk -F ' ' '{print $4}')
    [ "$own_user2" == "test" ]
    CHECK_RESULT $?
    [ "$own_group2" == "test" ]
    CHECK_RESULT $?
    #check chown help
    chown --help | grep -E "Usage|用法"
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}

main $@

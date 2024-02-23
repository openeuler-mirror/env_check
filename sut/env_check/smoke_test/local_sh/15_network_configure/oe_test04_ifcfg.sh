#!/usr/bin/bash
# author: wangdong
# Create: 2024-2-23  14:00
# Description: test the ifcfg command --  simplistic script which replaces ifconfig IP management

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

	ifcfg
    CHECK_RESULT $?

	which ifcfg	
    CHECK_RESULT $?
	
	# ifcfg eth0  add 192.168.0.1/24  
	# 为网口增加ip地址
    # CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2024-3-1  14:00
# Description: test the ifconfig command --  configure a network interface

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

	which ifconfig
    CHECK_RESULT $?
	
	ifconfig
    CHECK_RESULT $?
	
	ifconfig -a
    CHECK_RESULT $?

	#ifconfig eth0   # 查看网口eth0的IP地址
    #CHECK_RESULT $?

	#ifconfig eth0 up  # 查看
    #CHECK_RESULT $?
	
	#ifconfig eth0 down  #关闭网络接口
    #CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

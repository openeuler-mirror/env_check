#!/usr/bin/bash
# Create: 2023-11-16 16:43:30
# Auther: wangdong
# Description: Test more command -- file perusal filter for crt viewing

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

	#test1
	mkdir /tmp/tmp1/
	touch /tmp/tmp1/file1.txt
	echo "daemon:x:2:2:daemon:/sbin:/sbin/nologin" > /tmp/tmp1/file1.txt
	timeout 1 more /tmp/tmp1/file1.txt
	CHECK_RESULT $?

	#test2
	timeout 1 ps -ef | more > /dev/null
	CHECK_RESULT $?

	#test3
	echo "Single Line" | more
	CHECK_RESULT $?

	#test4:检查more进程是否存在
	if pgrep -x "more" > /dev/null; then
    	echo "more进程未正常退出"
    	exit 1
	else
    	echo "more进程已正常退出"
    	exit 0
	fi

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    #clean
    rm -rf /tmp/tmp1
    LOG_INFO "End to restore the test environment."
}

main $@

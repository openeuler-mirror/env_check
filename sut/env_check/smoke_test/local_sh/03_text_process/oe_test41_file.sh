#!/usr/bin/bash
# author: wangdong
# Create: 2024-11-25  11:30
# Description: file - determine file type

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
	echo "Testing file abcdefg12345" > /tmp/42.txt
    LOG_INFO "End to prepare the test environment."
}

function test_case(){
	file /tmp/42.txt
	# /tmp/42.txt: ASCII text
	CHECK_RESULT $?

	file -i /tmp/42.txt 
	#/tmp/42.txt: text/plain; charset=us-ascii
	CHECK_RESULT $?

	file /usr
	CHECK_RESULT $?
}

# 用例执行
function run_test() {
    # 检查 file 命令是否存在
    if ! command -v file &>/dev/null; then
        LOG_WARN "file command is not installed"
        CHECK_RESULT $? 0 0 "file command is required for this test."
    else
    	test_case
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/42.txt
	LOG_INFO "Finish environment cleanup!"
}

main $@

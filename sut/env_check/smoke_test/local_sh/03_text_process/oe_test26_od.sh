#!/usr/bin/bash
# author: wangdong
# Create: 2023-11-20  15:50 
# Description: test the od command - dump files in octal and other formats

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
	mkdir -p /tmp/test1/test1

	#以8进制显示文件的内容
	echo "Hello world" > /tmp/test1/test1/file1.txt
	od /tmp/test1/test1/file1.txt
    CHECK_RESULT $?

	#测试二进制文件
	echo -ne "\x48\x65\x6c\x6c\x6f\x2c\x20\x57\x6f\x72\x6c\x64\x21" > /tmp/test1/test1/1.bin
	od -t x1 /tmp/test1/test1/1.bin
    CHECK_RESULT $?

	echo "Finish test!"

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
	rm -rf /tmp/test1/test1
    LOG_INFO "Finish environment cleanup!"
}

main $@

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
	echo "zhangsan 80" > /tmp/test1/test1/file1.txt
	echo "lisi   70" > /tmp/test1/test1/file1.txt
	echo "wangwu 30" > /tmp/test1/test1/file2.txt
	echo "Jim   20" > /tmp/test1/test1/file2.txt
	paste /tmp/test1/test1/file1.txt  /tmp/test1/test1/file2.txt
    CHECK_RESULT $?
	cat /tmp/test1/test1/file1.txt

	paste -s /tmp/test1/test1/file1.txt
    CHECK_RESULT $?

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

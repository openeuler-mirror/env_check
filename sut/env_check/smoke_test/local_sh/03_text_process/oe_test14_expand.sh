#!/usr/bin/bash
# author: wangdong
# Create: 2023-10-12  16:00
# Description: test the expand command --将每个指定文件中的制表符转换为空格，写到标准输出。

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

    echo  "Start testing..."

    echo "zhangsan	90" >> /tmp/test_file1
    cat /tmp/test_file1

    expand -t 50 /tmp/test_file1
    cat /tmp/test_file1

    CHECK_RESULT $?	

    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
	rm -r /tmp/test_file1	
    LOG_INFO "Finish environment cleanup!"
}

main $@

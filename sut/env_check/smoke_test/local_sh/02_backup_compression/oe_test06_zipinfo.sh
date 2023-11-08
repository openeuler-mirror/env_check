#!/usr/bin/bash -x

# Create: 2023-08-29

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
    touch zhangsan1 zhangsan2 zhangsan3
    zip test zhangsan1 zhangsan2 zhangsan3
    zipinfo test.zip
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
	rm -rf  test.zip zhangsan1  zhangsan2  zhangsan3
    LOG_INFO "End to restore the test environment."
}

main $@

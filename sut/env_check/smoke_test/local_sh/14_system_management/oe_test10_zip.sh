#!/usr/bin/bash -x

# Create: 2023-12-08

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
    zip -h
    CHECK_RESULT $?

    zip --version
    CHECK_RESULT $?
    touch 1.txt
    echo "ddddd" >>1.txt
    zip 1.zip 1.txt
    rm -rf 1.txt 1.zip
    CHECK_RESULT $?
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# Create: 2024-4-8 15:38:56
# Auther: wangdong
# Description:  addftinfo  -  add  information to troff font files for use with groff
# addftinfo 读取一个troff字体文件并增加一些groff系统使用的附加字体点阵

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
    which addftinfo
    CHECK_RESULT $?

    rpm -qf /usr/bin/addftinfo
    CHECK_RESULT $?

    addftinfo --help | grep -E "Usage|usage|用法"
    CHECK_RESULT $?

    echo "Hello world! This is simple example" >> /tmp/testfile22.txt

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@
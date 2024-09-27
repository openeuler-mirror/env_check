#!/usr/bin/bash
# Create: 2024-10-11 15:00:00
# Auther: wangdong
# Description: bzip2 - bzip2, bunzip2 - a block-sorting file compressor, v1.0.4
# bzip2 命令行工具可以用于压缩和解压缩文件 


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
    # check whether bzip2 is installed or not
    if ! command -v bzip2 &> /dev/null; then
        LOG_WARN "bzip2 command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建文件
    mkdir -p /tmp/tmp2/
    touch /tmp/tmp2/text_0175
    echo "hello abc" > /tmp/tmp2/text_0175

    # 压缩文件
    bzip2  /tmp/text_0175

    # 解压缩文件
    bzip2 -d /tmp/text_0175.bz2

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -rf /tmp/tmp2/
    LOG_INFO "End to restore the test environment."
}

main $@

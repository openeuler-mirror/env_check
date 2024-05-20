#!/usr/bin/bash
# Create: 2024-05-20 10:08:07
# Auther: wangdong
# Description:   base32 - base32 encode/decode data and print to standard output
# 简介: Base32是一种编码方案，它将二进制数据编码为32个可打印的字符

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
    mkdir -p /tmp/tmp1
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    # 检查 base32 命令是否安装。
    if ! command -v base32 &> /dev/null; then
        LOG_WARN "babblocks command is not installed"
        CHECK_RESULT $? 0 0
    fi

    echo "hello" > /tmp/tmp1/example.txt
    # 编码文件
    base32 /tmp/tmp1/example.txt  > /tmp/tmp1/encoded.txt
    CHECK_RESULT $?
    
    # 解码文件
    base32  -d /tmp/tmp1/encoded.txt  > /tmp/tmp1/decoded.txt
    CHECK_RESULT $?

    # 编码标准输入
    echo "Hello,world" | base32
    CHECK_RESULT $?

    # 解码标准输入
    echo "JBSWY3DPEB3W64TMMQ======" | base32 -d
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -rf /tmp/tmp1
    LOG_INFO "End to restore the test environment."
}

main $@

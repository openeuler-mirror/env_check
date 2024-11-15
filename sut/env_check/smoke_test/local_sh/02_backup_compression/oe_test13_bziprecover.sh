#!/usr/bin/bash
# Create: 2024-10-17 15:00:00
# Auther: wangdong
# bzip2recover - 恢复损坏的 bzip2 文件


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
    # check whether bzip2recover is installed or not
    if ! command -v bzip2recover &> /dev/null; then
        LOG_WARN "bzip2recover command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建一个正常的压缩文件
    #mkdir -p /tmp/tmp2/
    #touch /tmp/tmp2/text_0176
    #echo "hello abc" > /tmp/tmp2/text_0176

    # 压缩文件
    #bzip2  /tmp/tmp2/text_0176

    # 损坏压缩文件
    #dd if=/dev/urandom  of=/tmp/tmp2/text_0176.bz2  bs=1  count=10  conv=notrunc

    # 使用bzip2recover恢复文件
    #bzip2recover /tmp/tmp2/text_0175.bz2

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    #rm -rf /tmp/tmp2/
    LOG_INFO "End to restore the test environment."
}

main $@

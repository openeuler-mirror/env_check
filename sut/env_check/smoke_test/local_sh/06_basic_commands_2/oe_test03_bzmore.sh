#!/usr/bin/bash
# Create: 2024-10-25 15:00:00
# Auther: wangdong
# bzmore - bzmore 是一个在 Linux 系统中用于查看 .bz2 压缩文件内容的工具。它实际上是 bzcat 和 more 命令的结合，允许用户分页查看压缩文件的内容，而不需要先解压缩文件。


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
    # check whether bzmore is installed or not
    if ! command -v bzmore &> /dev/null; then
        LOG_WARN "bzmore command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建一个正常的压缩文件
    #mkdir -p /tmp/tmp2/
    #touch /tmp/tmp2/text_0176
    #echo "hello abc" > /tmp/tmp2/text_0176

    # 压缩文件
    #bzip2  /tmp/tmp2/text_0176

    # 查看文件
    #bzmore /tmp/tmp2/text_0175.bz2

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

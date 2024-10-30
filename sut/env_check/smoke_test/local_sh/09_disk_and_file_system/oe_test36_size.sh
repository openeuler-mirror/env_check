#!/usr/bin/bash -x

# Create: 2024-01-25
# Author: wangbo

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

    # 检查帮助信息是否正确显示
    size --help | grep -E "Usage|--help"
    CHECK_RESULT $?

    # 使用 size 命令列出目标文件的段大小
    size /bin/ls > /tmp/size_ls_output.txt
    CHECK_RESULT $?

    # 使用 -A 参数列出段的详细信息
    size -A /bin/ls > /tmp/size_ls_detailed.txt
    CHECK_RESULT $?

    # 使用 -B 参数列出以字节为单位的大小
    size -B /bin/ls > /tmp/size_ls_bytes.txt
    CHECK_RESULT $?

    # 使用 -d 参数以十进制格式显示大小
    size -d /bin/ls > /tmp/size_ls_decimal.txt
    CHECK_RESULT $?

    # 使用 -o 参数以八进制格式显示大小
    size -o /bin/ls > /tmp/size_ls_octal.txt
    CHECK_RESULT $?

    # 使用 -x 参数以十六进制格式显示大小
    size -x /bin/ls > /tmp/size_ls_hex.txt
    CHECK_RESULT $?

    # 使用 size 命令测试多个文件
    size /bin/ls /bin/bash > /tmp/size_multiple_files.txt
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG
    rm -f /tmp/size_*.txt
    LOG_INFO "End to restore the test environment."
}

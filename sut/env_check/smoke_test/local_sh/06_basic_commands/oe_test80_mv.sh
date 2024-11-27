#!/usr/bin/bash
# Create: 2024-11-13 
# Auther: wuhuitao
# Description: A shellscript to check mv command.

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
    
    # 创建测试目录和文件
    mkdir -p /tmp/mv_test_dir
    touch /tmp/mv_test_file.txt  
    touch /tmp/mv_test_dir/mv_test_file.txt 
    touch /tmp/mv_test_dir/file1.txt
    touch /tmp/mv_test_dir/file2.txt

    # 测试 mv 命令，将文件移动到测试目录
    mv /tmp/mv_test_file.txt /tmp/mv_test_dir/
    CHECK_RESULT $?
    
    # 测试 -n 参数，不覆盖文件
    mv -n /tmp/mv_test_dir/mv_test_file.txt /tmp/mv_test_dir/mv_test_file.txt
    CHECK_RESULT $?

    # 测试 -v 参数，显示移动过程中的详细信息
    mv -v /tmp/mv_test_dir/mv_test_file.txt /tmp/mv_test_dir/mv_test_file_renamed.txt
    CHECK_RESULT $?

    # 测试 -t 参数，指定目标目录
    touch /tmp/mv_test_file_new.txt
    mv -t /tmp/mv_test_dir /tmp/mv_test_file_new.txt
    CHECK_RESULT $?

    # 删除测试目录和文件
    rm -rf /tmp/mv_test_dir
    rm -f /tmp/mv_test_file_new.txt

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main$@

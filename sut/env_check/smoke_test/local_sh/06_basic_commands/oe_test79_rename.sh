#!/usr/bin/bash
# Create: 2024-11-13 
# Auther: wuhuitao
# Description: A shellscript to check rename command.

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
    LOG_INFO "Start testing test command..."
    
    # 创建一些测试文件
    touch oldfile1.txt oldfile2.txt oldfile3.txt
    
    # 检查帮助信息是否正确显示
    rename --help 2>&1 | grep -E "Usage|--help"
    CHECK_RESULT $?

    #检查版本xin信息
    rename --version
    CHECK_RESULT $?

    # 将文件名中的 'old' 替换为 'new'
    rename 'old' 'new' oldfile*.txt
    CHECK_RESULT $?

    # 检查文件是否成功重命名
    ls | grep -E "newfile[0-9].txt"
    CHECK_RESULT $?

    #测试添加前缀功能
    rename 's/^/prefix_/' newfile*.txt
    LOG_INFO "Added prefix to files"
    CHECK_RESULT $?

    # 检查文件是否成功添加前缀
    ls -l | grep -E "^prefix_newfile.*"
    LOG_INFO "Checked if prefix is added successfully"
    CHECK_RESULT $?

    # 删除测试文件
    rm -f newfile*.txt oldfile*.txt    

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main$@

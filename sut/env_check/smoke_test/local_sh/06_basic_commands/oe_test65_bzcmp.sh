#!/usr/bin/bash
# Create: 2024-09-3  14:24:07
# Auther: wangdong
# bzcmp - bzcmp命令 – 比较.bz2压缩包中的文件

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
    # 检查 buildlocalearchive 命令是否安装。
    if ! command -v bzcmp &> /dev/null; then
        LOG_WARN "bzcmp command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建文件并向文件中添加内容
    echo "This is the content of file 1." > /tmp/file1.txt
    echo "This Is the Content of File 2." > /tmp/file2.txt

    # 使用bzip2压缩文件
    bzip2 /tmp/file1.txt
    bzip2 /tmp/file2.txt

    # 比较两个压缩包中的文件的不同：
    bzcmp /tmp/file1.txt.bz2  /tmp/file2.txt.bz2
    
    # 比较两个压缩包中的文件的不同并且不显示错误信息：
    bzcmp -s /tmp/file1.txt.bz2  /tmp/file2.txt.bz2
   
    # 比较两个压缩包中的文件的不同，且显示不同之处：
    bzcmp -l /tmp/file1.txt.bz2  /tmp/file2.txt.bz2

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -f /tmp/file1.txt  /tmp/file1.txt.bz2   /tmp/file2.txt  /tmp/file2.txt.bz2
    LOG_INFO "End to restore the test environment."
}

main $@

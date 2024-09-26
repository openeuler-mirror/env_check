#!/usr/bin/bash
# Create: 2024-09-19  09:41:07
# Auther: wangdong
# bzgrep, bzfgrep, bzegrep - search possibly bzip2 compressed files for a regular expression
# bzfgrep 是一个在 Linux 系统中用于搜索可能被 bzip2 压缩的文件中的正则表达式的命令。它是 bzgrep 命令的一个变体，专门用于调用 fgrep，即固定字符串的搜索，而不是 grep 的默认模式，后者使用扩展的正则表达式。

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
    # 检查 bzfgrep 命令是否安装。
    if ! command -v bzfgrep &> /dev/null; then
        LOG_WARN "bzfgrep command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建文件并向文件中添加内容
    echo "This is the conT8ent of file 1." > /tmp/file1.txt
    echo "This Is the C4untent of File 2." > /tmp/file2.txt

    # 使用bzip2压缩文件
    bzip2 -k /tmp/file1.txt
    bzip2 -k /tmp/file2.txt

    # 比较两个压缩包中的文件的不同：
    bzfgrep "conT8ent" /tmp/file1.txt.bz2
    bzfgrep "C4untent" /tmp/file2.txt.bz2
    
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

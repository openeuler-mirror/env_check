#!/usr/bin/bash
# Create: 2024-09-26  10:41:07
# Auther: wangdong
# bzgrep, bzfgrep, bzegrep - search possibly bzip2 compressed files for a regular expression

# bzgrep 是一个在 Linux 系统中用于搜索 Bzip2 压缩文件中的文本模式的工具。它结合了 grep 的搜索功能和 Bzip2 的解压缩功能，允许用户直接在压缩文件中搜索，而无需先解压整个文件。

# bzgrep 是调用 grep 来搜索模式。
# bzegrep 是调用 egrep（等同于 grep -E）来搜索模式，它支持扩展的正则表达式。
# bzfgrep 是调用 fgrep 来搜索模式，它在搜索时更快，因为它不使用正则表达式，而是搜索固定字符串。

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
    # 检查 bzgrep 命令是否安装。
    if ! command -v bzgrep &> /dev/null; then
        LOG_WARN "bzgrep command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建文件并向文件中添加内容
    echo "This is the conT8ent of file 1." > /tmp/file1
    echo "This Is the C4untent of File 2." > /tmp/file2

    # 使用bzip2压缩文件
    bzip2 -k /tmp/file1
    bzip2 -k /tmp/file2

    # 比较两个压缩包中的文件的不同：
    bzgrep "conT8ent" /tmp/file1.bz2
    bzgrep "C4untent" /tmp/file2.bz2
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -f /tmp/file1  /tmp/file1.bz2   /tmp/file2  /tmp/file2.bz2
    LOG_INFO "End to restore the test environment."
}

main $@

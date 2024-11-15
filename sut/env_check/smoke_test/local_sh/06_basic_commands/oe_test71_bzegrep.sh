#!/usr/bin/bash
# Create: 2024-09-19  09:41:07
# Auther: wangdong
# bzegrep - search possibly bzip2 compressed files for a regular expression

# bzgrep：这是最基本的形式，它在 bzip2 压缩的文件上调用 grep，用于搜索扩展的正则表达式。

# bzegrep：当 bzgrep 被调用为 bzegrep 时，它会使用 egrep 来代替 grep。egrep 是 grep 的一个版本，它默认使用扩展的正则表达式，就像 grep -E。

# bzfgrep：当 bzgrep 被调用为 bzfgrep 时，它会使用 fgrep 来代替 grep。fgrep 是一个快速搜索工具，它使用固定字符串而不是正则表达式进行搜索，通常比 grep 快，因为它不需要解释正则表达式。


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
    # 检查 bzegrep 命令是否安装。
    if ! command -v bzegrep &> /dev/null; then
        LOG_WARN "bzegrep command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 创建文件并向文件中添加内容
    echo "This is the conT8ent of file 1." > /tmp/file1.txt
    echo "This Is the C4untent of File 2." > /tmp/file2.txt

    # 使用bzip2压缩文件
    bzip2 -k /tmp/file1.txt
    bzip2 -k /tmp/file2.txt

    # 比较两个压缩包中的文件的不同：
    bzegrep 'con*ent' /tmp/file1.txt.bz2
    bzegrep 'C4*tent' /tmp/file2.txt.bz2
    
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

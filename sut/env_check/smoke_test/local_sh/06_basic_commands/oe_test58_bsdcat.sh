#!/usr/bin/bash
# Create: 2024-06-20  17:38:07
# Auther: wangdong
# bsdcat — expand files to standard output
# bsdcat 是一个命令行工具，用于将文件内容输出到标准输出。 

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
    # 检查 bsdcat 命令是否安装。
    if ! command -v bsdcat &> /dev/null; then
        LOG_WARN "bsdcat command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# bsdcat --version 
	# bsdcat --help 
	# Usage: bsdcat [-h] [--help] [--version] [--] [filenames...]

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

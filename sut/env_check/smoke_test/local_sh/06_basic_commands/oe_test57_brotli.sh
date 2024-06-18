#!/usr/bin/bash
# Create: 2024-06-18  19:38:07
# Auther: wangdong
# brotli(1) -- brotli, unbrotli - compress or decompress files
# Brotli 是一种用于压缩数据的算法，它被设计为一种快速、高效的压缩工具，适用于HTTP压缩。Brotli 压缩算法通常用于网页内容的压缩，以减少传输数据的大小，加快页面加载速度。

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
    # 检查 brotli 命令是否安装。
    if ! command -v brotli &> /dev/null; then
        LOG_WARN "brotli command is not installed"
        CHECK_RESULT $? 0 0
    fi
	# 压缩单个文件:
	# brotlipy input_file.txt -o output_file.br

	# 压缩并覆盖原文件:
	# brotlipy input_file.txt

	# 压缩目录中的所有文件:
	# find . -type f -name "*.txt" -exec brotlipy {} \;

	# 查看压缩级别:
	# brotlipy input_file.txt -o output_file.br --quality 11

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# Create: 2024-06-24  10:00:07
# Auther: wangdong
# tar -- manipulate tape archives
# bsdtar 是一个用于创建、查看或提取归档文件的工具，它是 libarchive 库的一部分。

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
    # 检查 bsdtar 命令是否安装。
    if ! command -v bsdtar &> /dev/null; then
        LOG_WARN "bsdtar command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# bsdtar --help 

	# 创建归档
    # bsdtar -czvf  arhive.tar.gz  /root/mnt
	LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

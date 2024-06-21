#!/usr/bin/bash
# Create: 2024-06-21  10:38:07
# Auther: wangdong
# cpio — copy files to and from archives

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
    # 检查 bsdcpio 命令是否安装。
    if ! command -v bsdcpio &> /dev/null; then
        LOG_WARN "bsdcpio command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# bsdcpio --help 

	# 创建归档
	# bsdcpio -o > archive.cpio

	# 提取归档
	# bsdcpio -i < archive.cpio

	# 查看归档
	# bsdcpio -it < archive.cpio
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

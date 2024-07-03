#!/usr/bin/bash
# Create: 2024-07-3  16:00:07
# Auther: wangdong
# bse - bclinux secure enhancement

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
    # 检查 bse 命令是否安装。
    if ! command -v bse &> /dev/null; then
        LOG_WARN "bse command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# bse --help 
	# bse check basic
	# bse fix basic
	LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# Create: 2024-07-10  16:00:07
# Auther: wangdong
# btattach - Bluetooth serial utility

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
    # 检查 btattach 命令是否安装。
    if ! command -v btattach &> /dev/null; then
        LOG_WARN "btattach command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# btattach - Bluetooth serial utility
	# Usage:
	# btattach [options]
	# options:
	# -B, --bredr <device>   Attach Primary controller
	# -A, --amp <device>     Attach AMP controller
	# -P, --protocol <proto> Specify protocol type
	# -S, --speed <baudrate> Specify which baudrate to use
	# -N, --noflowctl        Disable flow control
	# -h, --help             Show help options
	LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

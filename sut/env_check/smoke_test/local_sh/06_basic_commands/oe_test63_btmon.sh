#!/usr/bin/bash
# Create: 2024-07-26  11:00:07
# Auther: wangdong
# btmon - Bluetooth monitor

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
    # 检查 btmon 命令是否安装。
    if ! command -v btmon &> /dev/null; then
        LOG_WARN "btmon command is not installed"
        CHECK_RESULT $? 0 0
    fi

    #btmon - Bluetooth monitor
#Usage:
#	btmon [options]
#options:
#	-r, --read <file>      Read traces in btsnoop format
#	-w, --write <file>     Save traces in btsnoop format
#	-a, --analyze <file>   Analyze traces in btsnoop format
#	-s, --server <socket>  Start monitor server socket
#	-p, --priority <level> Show only priority or lower
#	-i, --index <num>      Show only specified controller
#	-d, --tty <tty>        Read data from TTY
#	-B, --tty-speed <rate> Set TTY speed (default 115200)
#	-V, --vendor <compid>  Set default company identifier
#	-t, --time             Show time instead of time offset
#	-T, --date             Show time and date information
#	-S, --sco              Dump SCO traffic
#	-A, --a2dp             Dump A2DP stream traffic
#	-E, --ellisys [ip]     Send Ellisys HCI Injection
#	-P, --no-pager         Disable pager usage
#	-J  --jlink <device>,[<serialno>],[<interface>],[<speed>]
#	                       Read data from RTT
#	-R  --rtt [<address>],[<area>],[<name>]
#	                       RTT control block parameters
#	-h, --help             Show help options

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

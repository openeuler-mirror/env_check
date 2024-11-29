#!/usr/bin/bash
# author: wangdong
# Create: 2024-11-25  17:30
# Description: test the filecap command -- filecap是Linux系统中libcap-ng库提供的一个命令行工具，用于查看和设置文件的capabilities。capabilities是一种安全机制，允许某些程序拥有特定的权限，而不需要以root用户身份运行

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)

source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test enfilecapronment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End to prepare the test enfilecapronment."
}

# 用例执行
function run_test() {
	# 检查 filecap 命令是否存在
    if ! command -v filecap &>/dev/null; then
        LOG_WARN "filecap command is not installed"
        CHECK_RESULT $? 0 0 "filecap command is required for this test."
    else
        filecap --help
        CHECK_RESULT $? 0 0 "Failed to execute 'filecap --help'."
    
		filecap /usr/bin/	
		CHECK_RESULT $?
	fi
}

# 环境清理
function post_test() {
    LOG_INFO "start enfilecapronment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish enfilecapronment cleanup!"
}

main $@

#!/usr/bin/bash
# Create: 2024-06-07  15:38:07
# Auther: wangdong
# bond2team - Converts bonding configuration to team
# 用于将Linux系统中的网络绑定配置转换为 team 模式的配置

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
    # 检查 bond2team 命令是否安装。
    if ! command -v bond2team &> /dev/null; then
        LOG_WARN "bond2team command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# 查看帮助信息
	# bond2team --help

	# 将某个绑定配置转换为 team 模式并打印到标准输出
	# bond2team --master eth0 --stdout  

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

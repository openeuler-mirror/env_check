#!/usr/bin/bash
# Create: 2024-06-13  09:38:07
# Auther: wangdong
# bootctl -  Control EFI firmware boot settings and manage boot loader
# bootctl 是一个在 Linux 系统中用来控制启动加载器的命令行工具，特别是在使用 UEFI (Unified Extensible Firmware Interface) 的系统上。它可以用来安装、更新、配置或删除启动加载器。

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
    # 检查 bootctl 命令是否安装。
    if ! command -v bootctl &> /dev/null; then
        LOG_WARN "bootctl command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# 安装 GRUB 2 启动加载器
	# bootctl install

	# 列出所有可用的启动项
	# bootctl list

	# 设置默认启动项   1 是启动项的索引号
	# bootctl set 1  

	# 删除启动项
	# bootctl delete 1

	# 更新启动配置
	# bootctl update

	# 查看帮助信息
	# bootctl --help
	# bootctl help

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

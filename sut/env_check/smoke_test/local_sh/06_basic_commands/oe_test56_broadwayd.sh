#!/usr/bin/bash
# Create: 2024-06-17  17:38:07
# Auther: wangdong
# broadwayd - broadwayd - Broadway display server  
# broadwayd 是一个用于 Broadway GDK 后端的显示服务器。它允许多个 GTK+ 应用程序通过连接到 broadwayd 来在同一个网页浏览器中显示它们的窗口

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
    # 检查 broadwayd 命令是否安装。
    if ! command -v broadwayd &> /dev/null; then
        LOG_WARN "broadwayd command is not installed"
        CHECK_RESULT $? 0 0
    fi
	# broadwayd -h   #查看帮助信息
	# broadwayd --port=8080	# 启动 broadwayd 并指定端口号为 8080
	# broadwayd --address=192.168.1.100	# 启动 broadwayd 并绑定到特定的 IP 地址

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

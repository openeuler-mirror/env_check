#!/usr/bin/bash
# Create: 2024-06-14  16:38:07
# Auther: wangdong
# bridge -  show / manipulate bridge addresses and devices
# bridge命令通常与网络相关，特别是在虚拟化技术中，比如在使用Docker容器时。在Docker中，bridge网络驱动允许容器通过一个虚拟的网络桥接连接到Docker主机的网络。这使得容器可以相互通信，也可以访问外部网络。

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
    # 检查 bridge 命令是否安装。
    if ! command -v bridge &> /dev/null; then
        LOG_WARN "bridge command is not installed"
        CHECK_RESULT $? 0 0
    fi

	# 创建网络
	# docker network create --driver bridge my-bridge-network
	
	# 运行容器
	# docker run --network my-drige-network -d my-image

	# 查看网络
	# docker network ls

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2024-3-15  10:00
# Description: test the route command  --  show / manipulate the IP routing table

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
    echo "Start test!"

    which route	 # 测试route指令
    CHECK_RESULT $?

    route	 # 显示核心路由表    
    CHECK_RESULT $?

    route -n -e  # 以netstat 指令格式显示核心路由表
    CHECK_RESULT $?

    #route add -host 192.168.0.1 dev eth0   # 添加一条到特定主机的路由表条目
    #route add -net 172.16.0.0/16 dev eth0   # 添加一条特定网络的路由表条目
    route -n 			   # 显示核心路由表
    #route del -host 192.168.0.1	   # 删除指定路由表条目
    CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

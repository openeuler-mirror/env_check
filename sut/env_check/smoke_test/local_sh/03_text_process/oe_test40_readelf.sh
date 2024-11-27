#!/usr/bin/bash
# author: wangdong
# Create: 2024-11-15  14:30
# Description: test the readelf command - 

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

    # 定义要输出的 C 代码
    code='// hello.c
#include <stdio.h>

int main() {
    printf("Hello, World!\\n");
    return 0;
}'

    # 将 C 代码输出到文件 hello.c
    echo "$code" > /tmp/hello1115.c
    fi
    gcc -o /tmp/hello1115   /tmp/hello1115.c

    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    # 检查 readelf 命令是否存在
    if ! command -v readelf &>/dev/null; then
        LOG_WARN "readelf command is not installed"
        CHECK_RESULT $? 0 0 "readelf command is required for this test."
    else
    	# 获取文件头部
    	readelf  -h /tmp/hello1115 >/dev/null 2>&1
    	CHECK_RESULT $? 

    	# 获取程序头部表
    	readelf  -l /tmp/hello1115 >/dev/null 2>&1
    	CHECK_RESULT $? 

    	# 获取动态段信息
    	readelf  -d /tmp/hello1115 >/dev/null 2>&1
    	CHECK_RESULT $? 
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/hello1115  /tmp/hello1115.c
    LOG_INFO "Finish environment cleanup!"
}

main $@

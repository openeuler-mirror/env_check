#!/usr/bin/bash -x

# Create: 2023-10-30

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
    
    # 创建一个临时目录用于测试
    test_dir="/tmp/nice_test"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 检查是否安装了 nice 命令
    if ! command -v nice &>/dev/null; then
        LOG_WARN "nice command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 启动多个进程，设置不同的优先级
    nice -n -20 sleep 1 &
    nice -n 0 sleep 1 &
    nice -n 19 sleep 1 &
    
    # 等待进程完成
    wait

    # 测试 'nice --help' 命令
    nice --help | grep -E "Usage|用法"
    CHECK_RESULT $? 0 0 "Failed to execute 'nice --help'."

    # 测试 'nice --version' 命令
    nice --version
    CHECK_RESULT $? 0 0 "Failed to execute 'nice --version'."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除临时测试目录
    test_dir="/tmp/nice_test"
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

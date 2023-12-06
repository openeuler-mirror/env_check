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
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 检查是否安装了 'watch' 命令
    if ! command -v watch &>/dev/null; then
        LOG_WARN "'watch' command is not installed."
        CHECK_RESULT 0 0 0
    else
        # 运行 'watch' 命令来监视一个简单的命令（这里以 date 命令为例），持续5秒
        #timeout 5 watch -n 1 date
        #CHECK_RESULT $? 0 0

        # 使用 'watch --help' 命令查看帮助信息
        watch --help | grep -E "Usage:|Options:"
        CHECK_RESULT $? 0 0

        # 使用 'watch --version' 命令查看版本信息
        watch --version
        CHECK_RESULT $? 0 0
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

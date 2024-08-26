#!/usr/bin/bash -x

# Create: 2023-08-29

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
    echo "Hello World" > hello.txt
    LOG_INFO "End to prepare the test environment."
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    # 检查 bzcat 命令是否存在
    if ! command -v bzcat &>/dev/null; then
        LOG_WARN "bzcat command is not installed"
        CHECK_RESULT $? 0 0 "bzcat command is required for this test."
    # 检查特定服务是否设置为开机启动
    else
        # 测试 'bzcat --help' 命令
        bzcat --help
        CHECK_RESULT $? 0 0 "Failed to execute 'bzcat --help'."
        bzip2 hello.txt
        bzcat hello.txt.bz2 | grep "Hello World"
        CHECK_RESULT $?
    fi    

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
	rm -rf hello.txt hello.txt.bz2
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash -x

# Create: 2024-11-26
# Auther: wuhuitao
# build-locale-archive

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"
# 环境准备
function pre_test() {
    LOG_INFO "Start environment preparation."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing timeout command..."
    # 测试 timeout 命令是否能够成功执行一个长时间运行的命令
    timeout 2 sleep 3
    local status=$?
    if [ $status -eq 0 ] || [ $status -eq 124 ]; then
        echo "SUCCESS: timeout should have killed the command after 2 seconds"
    else
        echo "ERROR: timeout should have killed the command after 2 seconds"
        echo "Line 25: Expected status 0 or 124, got $status"
        exit 1
    fi

    # 测试 timeout 命令是否能够成功执行一个短时间运行的命令
    timeout 5 sleep 1
    local status=$?
    if [ $status -eq 0 ] || [ $status -eq 124 ]; then
        echo "SUCCESS: timeout should not have killed the command as it finished before the timeout"
    else
        echo "ERROR: timeout should not have killed the command as it finished before the timeout"
        echo "Line 35: Expected status 0 or 124, got $status"
        exit 1
    fi
    # 测试 timeout 命令对非运行命令的处理
    timeout 1 false
    local status=$?
    if [ $status -eq 0 ] || [ $status -eq 1 ]; then
        echo "SUCCESS: timeout should return the exit status of the command"
    else
        echo "ERROR: timeout should return the exit status of the command"
        echo "Line 40: Expected status 0 or 1, got $status"
        exit 1
    fi

    LOG_INFO "Finish testing timeout command!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

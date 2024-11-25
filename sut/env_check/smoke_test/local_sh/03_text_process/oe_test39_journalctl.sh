#!/usr/bin/bash
# author: wangdong
# Create: 2024-11-18  14:30
# Description: journalctl - print log entries from the systemd journal

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

# 测试用例 1: 显示所有系统日志
test_case_1(){
	echo "测试用例 1: 显示所有系统日志"
    journalctl > /tmp/journalctl_all.log
	CHECK_RESULT $? 
}

# 测试用例 2: 显示特定服务的日志
test_case_2() {
    echo "测试用例 2: 显示特定服务的日志"
    # 假设我们想检查的是 systemd-logind 服务
    journalctl -u systemd-logind.service > /tmp/journalctl_service.log
	CHECK_RESULT $? 
}

# 测试用例 3: 显示最新的日志条目
test_case_3() {
    echo "测试用例 3: 显示最新的日志条目"
    journalctl --since "today" > /tmp/journalctl_today.log
	CHECK_RESULT $? 
}

# 用例执行
function run_test() {
    # 检查 lid 命令是否存在
    if ! command -v lid &>/dev/null; then
        LOG_WARN "lid command is not installed"
        CHECK_RESULT $? 0 0 "lid command is required for this test."
    else
    	test_case_1
    	test_case_2
    	test_case_3
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
	rm -f /tmp/journalctl_all.log /tmp/journalctl_service.log  /tmp/journalctl_today.log
    LOG_INFO "Finish environment cleanup!"
}

main $@

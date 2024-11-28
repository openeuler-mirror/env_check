#!/usr/bin/bash

# Create: 2024-10-31
# Author: wangbo

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
    
    # 列出所有服务状态
systemctl list-units --type=service
CHECK_RESULT $?

# 启动 sshd 服务
systemctl start sshd.service
CHECK_RESULT $?

# 检查服务状态
systemctl status sshd.service
CHECK_RESULT $?

# 重启服务
systemctl restart sshd.service
CHECK_RESULT $?

# 停止服务
systemctl stop sshd.service
CHECK_RESULT $?

# 启用服务
systemctl enable sshd.service
CHECK_RESULT $?

# 禁用服务
systemctl disable sshd.service
CHECK_RESULT $?

# 检查服务是否启用
ENABLE_STATUS=$(systemctl is-enabled sshd.service)
if [ "$ENABLE_STATUS" == "disabled" ]; then
    LOG_INFO "sshd.service is successfully disabled."
else
    LOG_ERROR "sshd.service is still enabled."
fi

# 检查服务是否正在运行
ACTIVE_STATUS=$(systemctl is-active sshd.service)
if [ "$ACTIVE_STATUS" == "inactive" ]; then
    LOG_INFO "sshd.service is inactive as expected after being disabled."
else
    LOG_ERROR "sshd.service is still active."
fi
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    rm -f /tmp/env_*.txt
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash

# Create: 2023-09-25
# Author: zengyifeng

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 生成带有时间戳的用户名
timestamp=$(date +%s)
username="testuser_$timestamp"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    
    # 检查用户是否已存在，如果存在就删除它
    if id "$username" &>/dev/null; then
        userdel "$username"
    fi
    
    # 创建用户
    useradd "$username"
    
    LOG_INFO "Created user: $username"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 帮助信息命令
    su --help | grep -E "Usage|用法"
    
    #检查 --help命令
    CHECK_RESULT $? 0 0 "Failed to execute 'su --help' command"
    
    # 版本信息命令
    su --version
    
    #检查 --version命令
    CHECK_RESULT $? 0 0 "Failed to execute 'su --version' command"
    
    #变更帐号为 root 并在执行 ls 指令后退出变回原使用者
    su -c ls root

    # 检查su命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute 'su -c ls root' command."

    # 获取当前用户
    current_user=$(whoami)
    
    # 切换到测试用户
    su - "$username" -c "logname"
    
    # 检查logname命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute 'logname' command."

    # 切换回当前用户
    su - "$current_user" -c "echo 'Switched back to $current_user'"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除测试用户
    userdel "$username"

    LOG_INFO "Deleted user: $username"
    LOG_INFO "End to restore the test environment."
}

main $@

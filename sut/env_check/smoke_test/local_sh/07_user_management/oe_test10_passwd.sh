#!/usr/bin/bash

# Create: 2023-09-22
# Author: zengyifeng

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

function generate_random_string() {
    length=${1-8}  # 默认长度为8
    tr -dc A-Za-z0-9 </dev/urandom | head -c "$length"
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."



    # 创建一个新的用户
    newuser="mytestuser_$(generate_random_string)"
    useradd -m "$newuser"
    # 检查上一条命令是否执行成功
    CHECK_RESULT $?

    # 使用 passwd 查看密码
    sudo passwd -S "$newuser"
    # 检查上一条命令是否执行成功
    CHECK_RESULT $?
    
    # 使用 passwd 删除密码
    sudo passwd -d "$newuser"
    # 检查上一条命令是否执行成功
    CHECK_RESULT $?
    
    # 使用 passwd 锁定用户
    sudo passwd -l "$newuser"
    # 检查上一条命令是否执行成功
    CHECK_RESULT $?
    
    # 使用 passwd 解锁用户
    sudo passwd -u "$newuser" -f
    # 检查上一条命令是否执行成功
    CHECK_RESULT $?  ###########################

    # 移除新用户
    sudo userdel -r "$newuser"
    # 检查上一条命令是否执行成功
    CHECK_RESULT $?



    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

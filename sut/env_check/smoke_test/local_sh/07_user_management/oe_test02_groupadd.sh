#!/usr/bin/bash

# Create: 2023-09-05
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
    
    # 创建一个临时目录用于测试
    test_dir="/tmp/groupadd_test"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}


random_group_name="mytestgroup_$(date +%s)"
random_user_group_name="mytestusergroup_$(date +%s)"

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    #random_group_name="mytestgroup_$(date +%s)"
    
    #random_user_group_name="mytestusergroup_$(date +%s)"


    # 创建一个系统用户组 (-r) 并指定组名
    #groupadd -r $random_group_name
    groupadd -r "$random_group_name"

    # 检查groupadd命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute groupadd command."

    # 创建一个用户组并指定 GID (-g 1000) 和组名
    #groupadd -g 1000 $random_user_group_name
    groupadd -g 1000 "$random_user_group_name"

    # 检查groupadd命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute groupadd command."

    # 检查新创建的系统用户组是否存在
    getent group "$random_group_name" >/dev/null 2>&1
    CHECK_RESULT $? 0 0 "The system group '$random_group_name' does not exist."

    # 检查新创建的用户组是否存在
    getent group "$random_user_group_name" >/dev/null 2>&1
    CHECK_RESULT $? 0 0 "The group '$random_user_group_name' does not exist."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除新创建的用户组
    groupdel $random_group_name
    groupdel $random_user_group_name

    # 删除临时测试目录
    test_dir="/tmp/groupadd_test"
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

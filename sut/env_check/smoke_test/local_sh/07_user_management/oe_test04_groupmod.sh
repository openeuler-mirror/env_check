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
    
    # 创建一个系统用户组 (-r) 并指定组名
    groupadd -r mytestgroup

    # 创建一个用户组并指定 GID (-g 1000) 和组名
    groupadd -g 1000 mytestusergroup
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 修改系统用户组的名称
    groupmod -n newtestgroup mytestgroup

    # 检查groupmod命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute groupmod command for system group name change."

    # 修改用户组的 GID
    groupmod -g 2000 mytestusergroup

    # 检查groupmod命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute groupmod command for user group GID change."

    # 检查新的系统用户组是否存在
    getent group newtestgroup >/dev/null 2>&1
    CHECK_RESULT $? 0 0 "The new system group 'newtestgroup' does not exist."

    # 获取用户组的 GID 并检查是否修改成功
    gid=$(getent group mytestusergroup | cut -d: -f3)
    #[ "$gid" -eq 2000 ] || CHECK_RESULT 1 "Failed to modify GID of user group."
    
    [ "$gid" -eq 2000 ] || CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除新创建的系统用户组和用户组
    groupdel newtestgroup
    groupdel mytestusergroup

    LOG_INFO "End to restore the test environment."
}

main $@

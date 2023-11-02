#!/usr/bin/bash

# Create: 2023-09-25
# Author: zengyifeng

# 获取脚本所在路径
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

#Linux pwconv命令用于开启用户的投影密码。

#Linux系统里的用户和群组密码，分别存放在名称为passwd和group的文件中，
#这两个文件位于/etc目录下。因系统运作所需，任何人都得以读取它们，造成安全上的破绽。
#投影密码将文件内的密码改存在/etc目录下的shadow和gshadow文件内，
#只允许系统管理者读取，同时把原密码置换为"x"字符，有效的强化了系统的安全性。

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 启用用户的影子口令文件
    pwconv
    
    # 检查grpconv命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute grpconv command."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

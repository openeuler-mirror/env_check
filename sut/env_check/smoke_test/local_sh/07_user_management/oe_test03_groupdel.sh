#!/usr/bin/bash -x

# Create: 2023-09-05

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
    test_dir="/tmp/groupdel_test"
    mkdir -p "$test_dir"
    
    # 创建一个系统用户组 (-r) 并指定组名
    groupadd -r mytestgroup

    # 创建一个用户组并指定 GID (-g 1000) 和组名
    groupadd -g 1000 mytestusergroup
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 删除系统用户组
    groupdel mytestgroup

    # 检查groupdel命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute groupdel command for system group."

    # 删除用户组
    groupdel mytestusergroup

    # 检查groupdel命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute groupdel command for user group."

    # 检查已删除的系统用户组是否存在
    getent group mytestgroup >/dev/null 2>&1
    CHECK_RESULT $? 0 1 "The system group 'mytestgroup' still exists after deletion."

    # 检查已删除的用户组是否存在
    getent group mytestusergroup >/dev/null 2>&1
    CHECK_RESULT $? 0 1 "The group 'mytestusergroup' still exists after deletion."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除临时测试目录
    test_dir="/tmp/groupdel_test"
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

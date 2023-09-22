#!/usr/bin/bash -x

# Create: 2023-09-05

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

function generate_random_string() {
    length=${1-8}  # 默认长度为8
    tr -dc A-Za-z0-9 </dev/urandom | head -c "$length"
}

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    
    # 生成带有时间戳的用户名
    timestamp=$(date +%s)
    username="testuser_$timestamp"
    
    # 检查用户是否已存在，如果存在就删除它
    if id "$username" &>/dev/null; then
        userdel "$username"
        
    fi
    
    # 生成带有随机性的组名
    random_string=$(generate_random_string)
    mytestgroup="mytestgroup_$random_string"
    
    # 检查组是否已存在，如果存在就删除它
    if getent group "$mytestgroup" &>/dev/null; then
        groupdel "$mytestgroup"
        
    fi
    
    # 创建用户
    useradd "$username"
    
    
    # 创建一个系统用户组 (-r) 并指定组名
    groupadd -r "$mytestgroup"
    

    LOG_INFO "Created user: $username"
    LOG_INFO "Created system group: $mytestgroup"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 添加用户到用户组
    usermod -aG "$mytestgroup" "$username"
    
    # 获取用户的组列表
    user_groups=$(groups "$username")
    
    # 检查是否包含指定的组
    echo "$user_groups" | grep -q "$mytestgroup"
    CHECK_RESULT $? 0 0 "User $username does not belong to group $mytestgroup."

    # 检查用户所属组
    groups "$username"
    CHECK_RESULT $? 0 0 "Failed to execute 'groups $username'."

    # 使用groups命令的-help参数查看帮助信息
    groups --help | grep -E "Usage:|Options:"
    CHECK_RESULT $? 0 0 "Failed to execute 'groups --help'."

    # 使用groups命令的--version参数查看版本信息
    groups --version
    CHECK_RESULT $? 0 0 "Failed to execute 'groups --version'."

    LOG_INFO "Finish test!"
}


# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除测试用户
    userdel "$username"
    
    
    # 删除测试组
    groupdel "$mytestgroup"
    

    LOG_INFO "Deleted user: $username"
    LOG_INFO "Deleted system group: $mytestgroup"
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash

# Create: 2023-10-08

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 生成随机字符串
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
    random_string=$(generate_random_string)
    username="testuser_${timestamp}_${random_string}"

    # 检查用户是否已存在，如果存在就删除它
    if id "$username" &>/dev/null; then
        userdel -r "$username"
    fi

    # 创建用户
    useradd "$username"

    LOG_INFO "Created user: $username"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 使用usermod命令修改用户信息
    #usermod -c "New Comment" -d /home/newhome -e 2023-12-31 -s /bin/bash -L -U -e 2023-12-31 -f 3 -g 100 -G wheel -l newlogin -m -o -p "$(openssl passwd -1 NewPassword)" -u 1001 "$username"
    #usermod -c "New Comment" -d /home/newhome -s /bin/bash -L -U -f 3 -g 100 -G wheel -l newlogin -m -o -p "$(openssl passwd -1 NewPassword)" -u 1001 "$username"

    # 检查usermod命令是否成功执行
    #CHECK_RESULT $? 0 0 "Failed to execute usermod command."

    # 使用usermod命令添加用户到附加组
    usermod -aG adm,users "$username"

    # 检查用户是否添加到附加组
    groups "$username" | grep -q "adm"
    CHECK_RESULT $? 0 0 "User $username was not added to the 'adm' group."
    groups "$username" | grep -q "users"
    CHECK_RESULT $? 0 0 "User $username was not added to the 'users' group."

    # 使用usermod命令修改用户密码
    usermod -p "$(openssl passwd -1 NewPassword123)" "$username"

    # 检查密码是否修改成功
    su - "$username" -c "echo 'NewPassword123' | su -c 'echo OK' - $username"
    CHECK_RESULT $? 0 0 "Failed to change password for user $username."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}

    # 删除测试用户
    userdel -r "$username"

    LOG_INFO "End to restore the test environment."
}

main $@

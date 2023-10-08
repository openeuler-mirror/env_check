#!/usr/bin/bash -x

# Create: 2023-10-08

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
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    # 创建用户
    useradd -m -s /bin/bash -c "Test User" -d "/home/$username" -G wheel "$username"
    
    # 检查useradd命令是否成功执行
    CHECK_RESULT $? 0 0 "Failed to execute 'useradd' command."

    # 检查用户是否存在
    id "$username"
    CHECK_RESULT $? 0 0 "User '$username' does not exist."

    # 检查用户家目录是否正确
    home_dir=$(eval echo "~$username")
    [ "$home_dir" == "/home/$username" ] || CHECK_RESULT 1 "Home directory for user '$username' is incorrect."

    # 检查用户的登录shell是否正确
    login_shell=$(getent passwd "$username" | cut -d: -f7)
    [ "$login_shell" == "/bin/bash" ] || CHECK_RESULT 1 "Login shell for user '$username' is incorrect."

    # 检查用户注释是否正确
    comment=$(getent passwd "$username" | cut -d: -f5)
    [ "$comment" == "Test User" ] || CHECK_RESULT 1 "Comment for user '$username' is incorrect."

    # 检查用户所属组是否正确
    primary_group=$(id -gn "$username")
    [ "$primary_group" == "$username" ] || CHECK_RESULT 1 "Primary group for user '$username' is incorrect."

    # 检查用户是否属于wheel组
    groups "$username" | grep -q "wheel"
    CHECK_RESULT $? 0 0 "User '$username' does not belong to the 'wheel' group."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除测试用户
    userdel -r "$username"

    LOG_INFO "Deleted user: $username"
    LOG_INFO "End to restore the test environment."
}

main $@

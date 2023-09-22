#!/usr/bin/bash -x

# Create: 2023-08-29

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

    # 创建一个新的组
    newgroup="mytestgroup_$(generate_random_string)"
    sudo groupadd "$newgroup"
    CHECK_RESULT $?

    # 创建一个新的用户，并将其添加到新组
    newuser="mytestuser_$(generate_random_string)"
    sudo useradd -m -G "$newgroup" "$newuser"
    CHECK_RESULT $?

    # 使用 gpasswd 添加用户到组
    sudo gpasswd -a "$newuser" "$newgroup"
    CHECK_RESULT $?

    # 使用 gpasswd 移除用户从组
    sudo gpasswd -d "$newuser" "$newgroup"
    CHECK_RESULT $?

    # 移除新用户
    sudo userdel -r "$newuser"
    CHECK_RESULT $?

    # 移除新组
    sudo groupdel "$newgroup"
    CHECK_RESULT $?
    
    # help参数
    gpasswd --help | grep -E "Usage|用法"
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

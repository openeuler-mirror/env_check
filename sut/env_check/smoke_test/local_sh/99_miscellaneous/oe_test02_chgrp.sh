#!/usr/bin/bash

# Create: 2023-11-01
# Author: your_name

# 获取当前日期和时间，格式为 YYYYMMDD-HHMMSS
current_date_time=$(date +"%Y%m%d-%H%M%S")

# 定义 OET_PATH 为当前脚本所在的目录
OET_PATH=$(cd "$(dirname "$0")" && pwd)
# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 设置语言环境变量为英文
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    # 创建一个带有时间戳的临时目录用于测试
    test_dir="/tmp/chgrp_test_$current_date_time"
    mkdir -p "$test_dir"
    # 创建一个测试文件和组
    test_file="$test_dir/testfile.txt"
    test_group="testgroup_$current_date_time"
    sudo groupadd "$test_group"
    touch "$test_file"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing chgrp command..."

    # 改变文件所属组
    sudo chgrp "$test_group" "$test_file"
    CHECK_RESULT $? 0 0 "Failed to change group of the file with chgrp."

    # 验证文件所属组
    if groups "$test_file" | grep -qw "$test_group"; then
        LOG_INFO "The group of $test_file has been successfully changed to $test_group."
    else
        LOG_ERROR "The group of $test_file is not changed to $test_group as expected."
        CHECK_RESULT $? 1 1 "The group change operation failed."
    fi

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 恢复原始语言环境变量
    export LANG=${OLD_LANG}
    # 删除临时测试目录和组
    sudo groupdel "$test_group"
    rm -rf "$test_dir"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main $@
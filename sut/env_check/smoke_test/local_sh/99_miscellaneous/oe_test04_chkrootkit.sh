#!/usr/bin/bash

# Create: 2023-11-01
# Author: your_name

# 获取当前日期和时间，格式为 YYYYMMDD-HHMMSS
current_date_time=$(date +"%Y%m%d-%H%M%S")

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 设置语言环境变量为英文，以确保日志输出的一致性
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    
    # 创建一个带有时间戳的临时目录用于测试
    test_dir="/tmp/chkrootkit_test_$current_date_time"
    mkdir -p "$test_dir"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing chkrootkit..."

    # 检查 chkrootkit 是否安装
    if ! command -v chkrootkit &>/dev/null; then
        LOG_WARN "chkrootkit is not installed. Please install it to perform the test."
        CHECK_RESULT $? 0 0 "chkrootkit is required for this test."
        
    else
        # 运行 chkrootkit 扫描
        LOG_INFO "Running chkrootkit scan..."
        chkrootkit | tee "$test_dir/chkrootkit_output.txt"
        CHECK_RESULT $? 0 0 "chkrootkit scan failed."
        
        # 检查 chkrootkit 扫描结果，这里可以根据实际需要添加更复杂的逻辑
        if grep -q "is not infected" "$test_dir/chkrootkit_output.txt"; then
            LOG_INFO "System is clean according to chkrootkit scan."
        else
            LOG_ERROR "chkrootkit scan detected potential issues."
            CHECK_RESULT $? 1 1 "System may be infected. Please check the scan output."
        fi
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 恢复原始语言环境变量
    export LANG=${OLD_LANG}
    
    # 删除带有时间戳的临时测试目录
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@
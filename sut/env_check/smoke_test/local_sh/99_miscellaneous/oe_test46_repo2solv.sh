#!/usr/bin/bash

# Create: 2024-11-26
# Author: Your Name

# 获取脚本所在路径
SCRIPT_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)

# 导入通用库函数
source "$SCRIPT_PATH/../../common/common_lib.sh"

# 定义测试目录和测试数据文件
current_date_time=$(date +%Y%m%d%H%M%S)
test_dir="/tmp/test_repo2solv_$current_date_time"
test_repo_file="$test_dir/test_repo.repo"
output_solv_file="$test_dir/test_repo.solv"

# Environment setup
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建测试目录
    mkdir -p "$test_dir"

    # 创建一个简单的 .repo 文件用于测试
    cat <<EOF > "$test_repo_file"
[example-repo]
name=Example Repository
baseurl=http://example.com/repo/
enabled=1
gpgcheck=0
EOF

    LOG_INFO "End to prepare the test environment."
}

# Test execution
function run_test() {
    LOG_INFO "Start testing the 'repo2solv' command..."

    # 检查 repo2solv 命令是否存在
    if ! command -v repo2solv &> /dev/null; then
        LOG_ERROR "'repo2solv' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "repo2solv command check failed."
        return
    else
        LOG_INFO "'repo2solv' command is available."
    fi

    # 测试将 repo 文件转换为 solv 文件
    repo2solv "$test_repo_file" > "$output_solv_file" 2>/dev/null
    CHECK_RESULT $? 0 "Failed to convert repo file to solv file."

    # 验证生成的 solv 文件是否存在且非空
    if [ -s "$output_solv_file" ]; then
        LOG_INFO "Successfully created solv file: $output_solv_file."
        CHECK_RESULT 0 0 "Solv file creation succeeded."
    else
        LOG_ERROR "Solv file is missing or empty: $output_solv_file."
        CHECK_RESULT 1 0 "Solv file creation failed."
    fi

    LOG_INFO "Finish test!"
}

# Environment cleanup
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试目录及文件
    rm -rf "$test_dir"
    LOG_INFO "End to restore the test environment."
}

# 主函数，协调测试流程
function main() {
    pre_test
    run_test
    post_test
}

# 执行主函数，并将脚本的参数传递给主函数
main "$@"

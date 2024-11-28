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
test_dir="/tmp/test_repomanage_$current_date_time"
repo_file="$test_dir/test_repo.repo"
output_file="$test_dir/repomanage_output.txt"

# Environment setup
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建测试目录
    mkdir -p "$test_dir"

    # 创建一个简单的 .repo 文件用于测试
    cat <<EOF > "$repo_file"
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
    LOG_INFO "Start testing the 'repomanage' command..."

    # 检查 repomanage 命令是否存在
    if ! command -v repomanage &> /dev/null; then
        LOG_ERROR "'repomanage' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "repomanage command check failed."
        return
    else
        LOG_INFO "'repomanage' command is available."
    fi

    # 使用 repomanage 对仓库文件进行处理（示例命令）
    repomanage "$repo_file" > "$output_file" 2>&1
    CHECK_RESULT $? 0 "Failed to run repomanage command."

    # 验证输出文件是否存在且非空
    if [ -s "$output_file" ]; then
        LOG_INFO "Successfully generated repomanage output: $output_file."
        CHECK_RESULT 0 0 "repomanage output verification passed."
    else
        LOG_ERROR "repomanage output is missing or empty."
        CHECK_RESULT 1 0 "repomanage output verification failed."
    fi

    # 验证输出文件内容是否符合预期（例如是否包含 repo 信息）
    if grep -q "Example Repository" "$output_file"; then
        LOG_INFO "repomanage output contains expected repository information."
        CHECK_RESULT 0 0 "repomanage output content verification passed."
    else
        LOG_ERROR "repomanage output does not contain expected repository information."
        CHECK_RESULT 1 0 "repomanage output content verification failed."
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

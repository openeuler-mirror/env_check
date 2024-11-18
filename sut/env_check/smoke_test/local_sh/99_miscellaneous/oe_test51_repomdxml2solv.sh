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
test_dir="/tmp/test_repomdxml2solv_$current_date_time"
repo_metadata_file="$test_dir/repo_metadata.xml"
output_solv_file="$test_dir/repo_metadata.solv"

# Environment setup
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建测试目录
    mkdir -p "$test_dir"

    # 创建一个简单的 repo metadata XML 文件，用于测试
    cat <<EOF > "$repo_metadata_file"
<?xml version="1.0" encoding="UTF-8"?>
<repomd>
    <data type="primary">
        <location href="primary.xml.gz"/>
    </data>
    <data type="filelists">
        <location href="filelists.xml.gz"/>
    </data>
    <data type="other">
        <location href="other.xml.gz"/>
    </data>
</repomd>
EOF

    LOG_INFO "End to prepare the test environment."
}

# Test execution
function run_test() {
    LOG_INFO "Start testing the 'repomdxml2solv' command..."

    # 检查 repomdxml2solv 命令是否存在
    if ! command -v repomdxml2solv &> /dev/null; then
        LOG_ERROR "'repomdxml2solv' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "repomdxml2solv command check failed."
        return
    else
        LOG_INFO "'repomdxml2solv' command is available."
    fi

    # 使用 repomdxml2solv 转换 repo metadata 文件为 solv 格式
    repomdxml2solv "$repo_metadata_file" "$output_solv_file" 2>&1
    CHECK_RESULT $? 0 "Failed to run repomdxml2solv command."

    # 验证生成的 solv 文件是否存在且非空
    if [ -s "$output_solv_file" ]; then
        LOG_INFO "Successfully generated solv file: $output_solv_file."
        CHECK_RESULT 0 0 "repomdxml2solv output verification passed."
    else
        LOG_ERROR "repomdxml2solv output is missing or empty."
        CHECK_RESULT 1 0 "repomdxml2solv output verification failed."
    fi

    # 验证 solv 文件是否包含预期的数据（例如 solv 数据结构）
    if grep -q "solv" "$output_solv_file"; then
        LOG_INFO "repomdxml2solv output contains expected solv structure."
        CHECK_RESULT 0 0 "repomdxml2solv solv structure verification passed."
    else
        LOG_ERROR "repomdxml2solv output does not contain expected solv structure."
        CHECK_RESULT 1 0 "repomdxml2solv solv structure verification failed."
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

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
test_dir="/tmp/test_repo_graph_$current_date_time"
repo_file="$test_dir/test_repo.repo"
output_graph_file="$test_dir/repo_graph_output.dot"

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
    LOG_INFO "Start testing the 'repo-graph' command..."

    # 检查 repo-graph 命令是否存在
    if ! command -v repo-graph &> /dev/null; then
        LOG_ERROR "'repo-graph' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "repo-graph command check failed."
        return
    else
        LOG_INFO "'repo-graph' command is available."
    fi

    # 使用 repo-graph 生成仓库的依赖图（输出为 dot 格式）
    repo-graph "$repo_file" > "$output_graph_file" 2>&1
    CHECK_RESULT $? 0 "Failed to run repo-graph command."

    # 验证生成的图文件是否存在且非空
    if [ -s "$output_graph_file" ]; then
        LOG_INFO "Successfully created the repo graph in DOT format: $output_graph_file."
        CHECK_RESULT 0 0 "repo-graph output verification passed."
    else
        LOG_ERROR "repo-graph output is missing or empty."
        CHECK_RESULT 1 0 "repo-graph output verification failed."
    fi

    # 验证输出文件中是否包含基本的图结构信息
    if grep -q "digraph" "$output_graph_file"; then
        LOG_INFO "repo-graph output contains expected graph structure."
        CHECK_RESULT 0 0 "repo-graph graph structure verification passed."
    else
        LOG_ERROR "repo-graph output is missing expected graph structure."
        CHECK_RESULT 1 0 "repo-graph graph structure verification failed."
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

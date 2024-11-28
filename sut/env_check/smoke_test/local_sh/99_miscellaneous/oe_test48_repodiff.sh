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
test_dir="/tmp/test_repodiff_$current_date_time"
repo_file_old="$test_dir/old_repo.repo"
repo_file_new="$test_dir/new_repo.repo"
diff_output="$test_dir/repodiff_output.log"

# Environment setup
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建测试目录
    mkdir -p "$test_dir"

    # 创建一个旧的 .repo 文件作为基准
    cat <<EOF > "$repo_file_old"
[example-repo-old]
name=Old Example Repository
baseurl=http://example.com/old-repo/
enabled=1
gpgcheck=0
EOF

    # 创建一个新的 .repo 文件，添加一些不同内容
    cat <<EOF > "$repo_file_new"
[example-repo-new]
name=New Example Repository
baseurl=http://example.com/new-repo/
enabled=1
gpgcheck=0
EOF

    LOG_INFO "End to prepare the test environment."
}

# Test execution
function run_test() {
    LOG_INFO "Start testing the 'repodiff' command..."

    # 检查 repodiff 命令是否存在
    if ! command -v repodiff &> /dev/null; then
        LOG_ERROR "'repodiff' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "repodiff command check failed."
        return
    else
        LOG_INFO "'repodiff' command is available."
    fi

    # 使用 repodiff 对比两个 repo 文件
    repodiff "$repo_file_old" "$repo_file_new" > "$diff_output" 2>&1
    CHECK_RESULT $? 0 "Failed to run repodiff command."

    # 验证输出日志中是否包含预期的差异
    if grep -q "name=" "$diff_output"; then
        LOG_INFO "repodiff found differences in the repo files."
        CHECK_RESULT 0 0 "repodiff output verification passed."
    else
        LOG_ERROR "repodiff did not find the expected differences."
        CHECK_RESULT 1 0 "repodiff output verification failed."
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

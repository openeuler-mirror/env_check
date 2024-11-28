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
test_dir="/tmp/test_repoclosure_$current_date_time"
test_repo_file="$test_dir/test_repo.repo"
test_package="test-package"

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

    # 创建一个假的包用于测试
    mkdir -p "$test_dir/$test_package"
    touch "$test_dir/$test_package/$test_package.rpm"

    LOG_INFO "End to prepare the test environment."
}

# Test execution
function run_test() {
    LOG_INFO "Start testing the 'repoclosure' command..."

    # 检查 repoclosure 命令是否存在
    if ! command -v repoclosure &> /dev/null; then
        LOG_ERROR "'repoclosure' command is not installed or not found in PATH."
        CHECK_RESULT $? 0 "repoclosure command check failed."
        return
    else
        LOG_INFO "'repoclosure' command is available."
    fi

    # 使用 repoclosure 检查依赖闭环（假设存在一个包）
    repoclosure -r "$test_repo_file" --resolve "$test_package" 2>&1 | tee "$test_dir/repoclosure_output.log"
    CHECK_RESULT $? 0 "Failed to run repoclosure command."

    # 验证输出日志中是否包含期望的结果
    if grep -q "$test_package" "$test_dir/repoclosure_output.log"; then
        LOG_INFO "repoclosure found the package and dependencies."
        CHECK_RESULT 0 0 "repoclosure output verification passed."
    else
        LOG_ERROR "repoclosure did not find the expected package or dependencies."
        CHECK_RESULT 1 0 "repoclosure output verification failed."
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

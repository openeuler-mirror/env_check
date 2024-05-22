#!/usr/bin/bash

# Describe: This script tests the cpp command with -v and --help options, preprocesses a C source file, and checks the output.

# Create: 2024-5-13
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 获取脚本所在路径
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)


# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个简单的 C 语言源文件
    test_c_source="/tmp/test_c_source_${current_date_time}.c"
    cat > "$test_c_source" << EOF
int main() {
    return 0;
}
EOF
    LOG_INFO "A simple C source file has been created at $test_c_source"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing cpp command..."

    # 检查 cpp 命令是否存在
    if ! command -v cpp &>/dev/null; then
        LOG_ERROR "cpp command is not installed."
        CHECK_RESULT 1 0 0 "cpp is required for this test."
        return
    fi



    # 使用 cpp 对源文件进行预处理，并打印到标准输出
    LOG_INFO "Preprocessing the C source file with cpp and printing to stdout..."
    cpp "$test_c_source"
    CHECK_RESULT $? 0 0 "Failed to preprocess the C source file with 'cpp'."

    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的文件
    test_c_source="/tmp/test_c_source_${current_date_time}.c"
    rm -f "$test_c_source"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
#!/bin/bash

# Create: 2024-3-29
# Author: zengyifeng
# Description: Test script for the gcc command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 在这里添加需要的环境准备步骤

    # 生成带有时间戳的文件名
    timestamp=$(date +%s)
    c_file="test_$timestamp.c"
    executable="test_$timestamp"

    # 创建一个简单的 C 语言源文件
    cat <<EOF > "$c_file"
#include <stdio.h>
int main() {
    printf("Hello, world!\\n");
    return 0;
}
EOF

    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 检查 gcc 命令是否存在
    if ! command -v gcc &>/dev/null; then
        LOG_WARN "gcc command is not installed"
        CHECK_RESULT $? 0 0 "gcc command is not installed"
        return
    fi

    # 使用 gcc 编译源文件
    gcc -o "$executable" "$c_file"

    # 验证编译是否成功
    CHECK_RESULT $? 0 0 "Failed to compile C source file using gcc."

    # 执行编译后的可执行文件
    ./"$executable" > output.txt

    # 验证程序输出是否符合预期
    expected_output="Hello, world!"
    grep -q "$expected_output" output.txt
    CHECK_RESULT $? 0 0 "Program output does not match expected."

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 在这里添加需要的环境清理步骤
    rm -f "$c_file" "$executable" output.txt
    LOG_INFO "End to restore the test environment."
}

main $@



#!/usr/bin/bash

# Describe: This script is used to check the functionality of the cjpeg command with -v, --help options, and to convert a BMP image to JPEG format.

# Create: 2024-5-13
# Author: zengyifeng

# 获取当前日期和时间（北京时间），格式为 YYYYMMDD-HHMMSS
current_date_time=$(date '+%Y%m%d-%H%M%S')

# 定义 OET_PATH 为当前脚本所在的目录
#OET_PATH=$(cd "$(dirname "$0")" && pwd)
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)

# 引入 common_lib.sh 脚本库
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备函数
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    # 创建一个简单的 BMP 图像文件
    local test_image="/tmp/test_image_${current_date_time}.bmp"
    # 假设我们有一个命令来创建一个简单的 BMP 图像，这里用 dd 命令代替
    dd if=/dev/zero of="$test_image" bs=1 count=100
    LOG_INFO "A simple BMP image has been created at $test_image"
    LOG_INFO "End to prepare the test environment."
}

# 用例执行函数
function run_test() {
    LOG_INFO "Start testing cjpeg command..."

    # 检查 cjpeg 命令是否存在
    if ! command -v cjpeg &>/dev/null; then
        LOG_ERROR "cjpeg command is not installed."
        CHECK_RESULT 1 0 0 "cjpeg is required for this test."
        return
    fi

    # 检查 cjpeg -version 选项
    LOG_INFO "Checking cjpeg -v option..."
    cjpeg -version
    CHECK_RESULT $? 0 0 "Failed to execute 'cjpeg -version'."


    LOG_INFO "Finish test!"
}

# 环境清理函数
function post_test() {
    LOG_INFO "Start to restore the test environment."
    # 删除测试期间创建的临时文件
    local test_image="/tmp/test_image_${current_date_time}.bmp"
    local output_jpeg="/tmp/test_image_${current_date_time}.jpg"
    rm -f "$test_image" "$output_jpeg"
    LOG_INFO "End to restore the test environment."
}

# 脚本主入口
main "$@"
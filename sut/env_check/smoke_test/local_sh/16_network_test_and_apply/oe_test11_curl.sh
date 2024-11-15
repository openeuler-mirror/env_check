#!/usr/bin/bash
# Create: 2024-09-25 17:53:12
# Auther: wangbo
# Description: A shellscript to check curl command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing curl..."

    # 测试网络条件
    ping -c 1 baidu.com
    if [ $? -eq 0 ]; then
      mkdir -p /tmp/curl-test-dir
      cd /tmp/curl-test-dir

      # 1. 测试 -o: 将输出保存到指定文件
      curl -o one.html www.baidu.com
      CHECK_RESULT $? 0 0 "curl -o error"

      # 2. 测试 -O: 使用远程文件的名称保存
      curl -O https://mirrors.cmecloud.cn/img/ecloud_logo.f05d05c9.png
      CHECK_RESULT $? 0 0 "curl -O error"

      # 3. 测试 -f: 遇到HTTP错误时静默失败
      curl -f www.baidu.com/404
      CHECK_RESULT $? 22 0 "curl -f error"

      # 4. 测试 -i: 包含协议响应头在输出中
      curl -i www.baidu.com | grep -E "HTTP/1.1"
      CHECK_RESULT $? 0 0 "curl -i error"

      # 5. 测试 -s: 静默模式，不显示进度和错误
      curl -s www.baidu.com/404 -o silent.html
      CHECK_RESULT $? 0 0 "curl -s error"

      # 6. 测试 -A: 发送自定义的User-Agent
      curl -A "MyUserAgent" www.baidu.com -o custom_user_agent.html
      CHECK_RESULT $? 0 0 "curl -A error"

      # 7. 测试 -v: 详细模式，显示更多信息
      curl -v www.baidu.com -o verbose.html
      CHECK_RESULT $? 0 0 "curl -v error"

      # 8. 测试 -V: 显示curl版本信息
      curl -V
      CHECK_RESULT $? 0 0 "curl -V error"

    else
        echo "无法连接网络！"
    fi

    LOG_INFO "Finish testing curl!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -rf /tmp/curl-test-dir
    LOG_INFO "End to restore the test environment."
}

main $@
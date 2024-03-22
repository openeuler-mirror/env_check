#!/usr/bin/bash
# Create: 2024-03-21 09:54:43
# Auther: hebinxin
# Description: A shellscript to check wget command.

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
    LOG_INFO "Start testing..."

    # 测试网络条件
    ping -c 1 baidu.com
    if [ $? -eq 0 ]; then
        # 1. test wget -O: 指定文件名
        wget www.baidu.com -O $OET_PATH/one.html
        CHECK_RESULT $? 0 0 "wget -O error"

        # 2. test -F: 设置为HTML格式
        wget -F www.baidu.com -O $OET_PATH/two.html
        CHECK_RESULT $? 0 0 "wget -F error"

        # 3. test -P: 将文件保存到指定位置
        wget -P $OET_PATH www.baidu.com -O $OET_PATH/three.html
        CHECK_RESULT $? 0 0 "wget -P error"

        # 4. test -R: 排除某些类型文件
        wget -R .jpg,.jpeg,.git www.baidu.com -O $OET_PATH/four.html
        CHECK_RESULT $? 0 0 "wget -R error"
    else
        echo "无法连接网络！"
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -f $OET_PATH/*.html
    LOG_INFO "End to restore the test environment."
}

main $@
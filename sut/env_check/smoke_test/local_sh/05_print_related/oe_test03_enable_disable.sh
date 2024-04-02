#!/usr/bin/bash
# author: wangdong
# Create: 2024-4-2  10:00
# Description: test the enable/disable command -- enable/disable printer

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
    echo "Start test!"

    lpstat -p -d   	# 列出可用的打印机
    CHECK_RESULT $?

    #lpoptions -d hp_printer    # 设置默认打印机
    #CHECK_RESULT $?
   
    enable --help
    CHECK_RESULT $?

    #enable hp_printer    # 启动名为hp_printer的打印机 
    #CHECK_RESULT $?

    echo "abcdefg" >> /root/test-printed.txt
    lp /root/test.txt    # 打印文件
    CHECK_RESULT $?
    
    disable --help
    CHECK_RESULT $?

    #disable hp_printer  # 停止名为hp_printer的打印机
    #CHECK_RESULT $?
    
    CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -rf /root/test-printed.txt
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

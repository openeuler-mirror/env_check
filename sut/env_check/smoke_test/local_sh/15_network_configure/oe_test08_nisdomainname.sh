#!/usr/bin/bash
# author: wangdong
# Create: 2024-3-15  10:00
# Description: test the nisdomainname command  -- show or set the system's NIS/YP domain name

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

    which nisdomainname
    CHECK_RESULT $?
	
    nisdomainname  cmcc	# 设置本地域名
    CHECK_RESULT $?

    ypdomainname	# 显示NIS域名
    CHECK_RESULT $?

    nisdomainname
    CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

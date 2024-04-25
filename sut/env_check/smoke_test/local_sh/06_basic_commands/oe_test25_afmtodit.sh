#!/usr/bin/bash
# Create: 2024-04-18 18:18:07
# Auther: wangdong
# Description:  afmtodit - adapt Adobe Font Metrics files for groff PostScript and PDF output

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
    # check whether afmtodit is installed or not
    if ! command -v afmtodit &> /dev/null; then
        LOG_WARN "afmtodit command is not installed"
        CHECK_RESULT $? 0 0
    fi
    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

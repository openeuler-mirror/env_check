#!/usr/bin/bash -x

# Create: 2024-10-31
# Auther: wangbo
# build-locale-archive

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"
# 环境准备
function pre_test() {
    LOG_INFO "Start environment preparation."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing......"

    nm /bin/ls > /tmp/nm_ls_output.txt
    CHECK_RESULT $?

    nm -a /bin/ls > /tmp/nm_ls_all_symbols.txt
    CHECK_RESULT $?

    nm -g /bin/ls > /tmp/nm_ls_global_symbols.txt
    CHECK_RESULT $?

    nm -u /bin/ls > /tmp/nm_ls_undefined_symbols.txt
    CHECK_RESULT $?

    nm -n /bin/ls > /tmp/nm_ls_sorted_by_address.txt
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -f /tmp/nm_ls_*.txt
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
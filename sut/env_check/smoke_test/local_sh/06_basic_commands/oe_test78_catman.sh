#!/usr/bin/bash -x

# Create: 2024-11-04
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
    LOG_INFO "Start testing catman..."

    catman -C /etc/man_db.conf
    CHECK_RESULT $? 0 0 "catman -C failed to use the specified config file"

    catman -h
    CHECK_RESULT $? 0 0 "catman -h failed to display help information"

    catman -V
    CHECK_RESULT $? 0 0 "catman -V failed to display version information"

    catman
    CHECK_RESULT $? 0 0 "catman failed to process default man pages"

    LOG_INFO "Finish testing catman!"
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
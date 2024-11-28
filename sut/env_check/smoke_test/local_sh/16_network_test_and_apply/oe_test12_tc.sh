#!/usr/bin/bash -x

# Create: 2024-11-28
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
function run_test() {
    LOG_INFO "Start testing nft..."

    which tc > /dev/null 2>&1
    CHECK_RESULT $? 0 0 "tc is not installed!"

    tc qdisc show > result.txt
    grep -q "qdisc" result.txt
    CHECK_RESULT $? 0 0 "tc qdisc show failed"

    tc --help > result.txt
    grep -q "Usage: tc" result.txt
    CHECK_RESULT $? 0 0 "tc --help failed"

    rm -f result.txt
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
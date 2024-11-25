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
function run_nft_test() {
    LOG_INFO "Start testing nft..."

    nft list ruleset
    CHECK_RESULT $? 0 0 "nft failed to list ruleset"

    nft -a list ruleset
    CHECK_RESULT $? 0 0 "nft -a failed to display rule handles"

    nft add table inet my_table
    CHECK_RESULT $? 0 0 "nft add table failed to display rule handles"

    nft list table inet my_table
    CHECK_RESULT $? 0 0 "nft list table failed to display rule handles"

    nft delete table inet my_table
    CHECK_RESULT $? 0 0 "nft delete table failed to display rule handles"

    LOG_INFO "Finish testing nft!"
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
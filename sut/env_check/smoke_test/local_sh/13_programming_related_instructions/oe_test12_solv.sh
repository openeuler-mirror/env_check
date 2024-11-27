#!/usr/bin/bash -x

# Create: 2024-11-12
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

    LOG_INFO "Start testing..."

    solv list > solv_output.txt
    CHECK_RESULT $? 0 0 "solv list failed to list installed packages"

    solv search curl > solv_output.txt
    CHECK_RESULT $? 0 0 "solv search curl failed to search for package curl"

    solv info curl > solv_output.txt
    CHECK_RESULT $? 0 0 "solv info curl failed to display information for package curl"

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
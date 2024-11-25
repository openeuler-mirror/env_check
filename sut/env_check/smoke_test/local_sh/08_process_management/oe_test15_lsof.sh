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

function run_lsof_test() {
    LOG_INFO "Start testing lsof..."

    lsof
    CHECK_RESULT $? 0 0 "lsof command failed to display open files"

    lsof -u $(whoami)
    CHECK_RESULT $? 0 0 "lsof -u error"

    lsof -p $$
    CHECK_RESULT $? 0 0 "lsof -p error for current shell process"

    lsof -i
    CHECK_RESULT $? 0 0 "lsof -i error"

    lsof -d 1
    CHECK_RESULT $? 0 0 "lsof -d error"

    lsof -i -n -P
    CHECK_RESULT $? 0 0 "lsof -n -P error"

    lsof -c bash
    CHECK_RESULT $? 0 0 "lsof -c error for bash"

    lsof -t
    CHECK_RESULT $? 0 0 "lsof -t error"

    touch testfile.txt
    lsof testfile.txt
    CHECK_RESULT $? 0 0 "lsof failed to display info for testfile.txt"
    rm -f testfile.txt

    LOG_INFO "Finish testing lsof!"
}



# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
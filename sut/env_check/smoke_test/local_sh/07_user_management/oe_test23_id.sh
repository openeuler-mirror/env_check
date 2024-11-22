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
function run_id_test() {
    LOG_INFO "Start testing id..."

    id
    CHECK_RESULT $? 0 0 "id command error for current user"

    id -u
    CHECK_RESULT $? 0 0 "id -u error"

    id -g
    CHECK_RESULT $? 0 0 "id -g error"

    id -G
    CHECK_RESULT $? 0 0 "id -G error"

    id -un
    CHECK_RESULT $? 0 0 "id -un error"

    id -gn
    CHECK_RESULT $? 0 0 "id -gn error"

    id -Gn
    CHECK_RESULT $? 0 0 "id -Gn error"

    id root
    CHECK_RESULT $? 0 0 "id command error for root user"

    LOG_INFO "Finish testing id!"
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
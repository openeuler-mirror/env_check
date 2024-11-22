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

    LOG_INFO "Start testing test command..."

    test "hello" = "hello"
    CHECK_RESULT $? 0 0 "test string equality failed"

    test "hello" != "world"
    CHECK_RESULT $? 0 0 "test string inequality failed"

    test -z ""
    CHECK_RESULT $? 0 0 "test for empty string failed"

    test -n "nonempty"
    CHECK_RESULT $? 0 0 "test for non-empty string failed"

    touch /tmp/test_file.txt
    test -e /tmp/test_file.txt
    CHECK_RESULT $? 0 0 "test file existence failed"
    rm -f test_file.txt

    test 5 -lt 10
    CHECK_RESULT $? 0 0 "test integer less-than (-lt) failed"

    test 10 -ge 10
    CHECK_RESULT $? 0 0 "test integer greater-than-or-equal (-ge) failed"

    test 5 -le 10
    CHECK_RESULT $? 0 0 "test integer less-than-or-equal (-le) failed"

    LOG_INFO "Finish testing test command!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
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

    LOG_INFO "Start testing..."

    dir > /tmp/dir_output.txt
    CHECK_RESULT $?
    test -s /tmp/dir_output.txt
    CHECK_RESULT $?

    dir -l > /tmp/dir_long_output.txt
    CHECK_RESULT $?
    grep -E "drwx|rw-" /tmp/dir_long_output.txt
    CHECK_RESULT $?

    dir -a > /tmp/dir_all_files.txt
    CHECK_RESULT $?
    grep -q "^\." /tmp/dir_all_files.txt
    CHECK_RESULT $?

    dir -t > /tmp/dir_sorted_by_time.txt
    CHECK_RESULT $?
    diff <(ls -t) /tmp/dir_sorted_by_time.txt
    CHECK_RESULT $?

    mkdir -p /tmp/dir_test/subdir
    touch /tmp/dir_test/file1 /tmp/dir_test/subdir/file2
    dir -R /tmp/dir_test > /tmp/dir_recursive.txt
    CHECK_RESULT $?
    grep "subdir/file2" /tmp/dir_recursive.txt
    CHECK_RESULT $?

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -rf /tmp/dir_output.txt /tmp/dir_long_output.txt /tmp/dir_all_files.txt /tmp/dir_sorted_by_time.txt /tmp/dir_recursive.txt /tmp/dir_test
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
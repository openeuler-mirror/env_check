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
# 用例执行
function run_test() {

    LOG_INFO "Start testing..."

    echo -e "Line 1\nLine 2\nLine 3" > test_file.txt
    gzip test_file.txt

    echo "q" | zmore test_file.txt.gz > result.txt 2>&1
    CHECK_RESULT $? 0 0 "zmore failed to display content"
    grep -q "Line 1" result.txt
    CHECK_RESULT $? 0 0 "zmore did not display the correct content"

    echo -e "Another file content" > test_file2.txt
    gzip test_file2.txt
    echo "q" | zmore test_file.txt.gz test_file2.txt.gz > result.txt 2>&1
    CHECK_RESULT $? 0 0 "zmore failed to display multiple files"
    grep -q "Another file content" result.txt
    CHECK_RESULT $? 0 0 "zmore did not display the correct content for multiple files"

    zmore invalid_file.gz > result.txt 2>&1
    CHECK_RESULT $? 1 0 "zmore did not handle invalid file name correctly"
    grep -q "No such file or directory" result.txt
    CHECK_RESULT $? 0 0 "zmore error message for invalid file name is incorrect"

    zmore --help > result.txt 2>&1
    CHECK_RESULT $? 0 0 "zmore --help command failed"
    grep -q "usage: zmore" result.txt
    CHECK_RESULT $? 0 0 "zmore --help output is incorrect"

    rm -f test_file.txt test_file.txt.gz test_file2.txt test_file2.txt.gz test_pipe.gz result.txt

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
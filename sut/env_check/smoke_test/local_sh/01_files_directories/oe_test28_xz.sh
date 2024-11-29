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

    echo "This is a test file for xz command." > test_file.txt

    xz test_file.txt > result.txt 2>&1
    CHECK_RESULT $? 0 0 "xz compression failed"
    [ -f test_file.txt.xz ] && CHECK_RESULT 0 0 0 "Compressed file not created"

    xz -d test_file.txt.xz > result.txt 2>&1
    CHECK_RESULT $? 0 0 "xz decompression failed"
    [ -f test_file.txt ] && CHECK_RESULT 0 0 0 "Decompressed file not created"

    echo "This is a test for standard input/output." | xz > test_output.xz
    CHECK_RESULT $? 0 0 "xz standard input compression failed"
    [ -f test_output.xz ] && CHECK_RESULT 0 0 0 "Compressed output file not created"

    xz -d < test_output.xz > test_output.txt
    CHECK_RESULT $? 0 0 "xz standard output decompression failed"
    grep -q "This is a test for standard input/output." test_output.txt
    CHECK_RESULT $? 0 0 "Decompressed content is incorrect"

    xz -9 test_file.txt > result.txt 2>&1
    CHECK_RESULT $? 0 0 "xz -9 compression failed"
    [ -f test_file.txt.xz ] && CHECK_RESULT 0 0 0 "Compressed file not created with -9"
    xz -d test_file.txt.xz > result.txt 2>&1

    xz --help > result.txt 2>&1
    CHECK_RESULT $? 0 0 "xz --help command failed"
    grep -q "Compress files with xz" result.txt
    CHECK_RESULT $? 0 0 "xz --help output is incorrect"

    xz --version > result.txt 2>&1
    CHECK_RESULT $? 0 0 "xz --version command failed"
    grep -q "xz (XZ Utils)" result.txt
    CHECK_RESULT $? 0 0 "xz --version output is incorrect"

    rm -f test_file.txt test_output.xz test_output.txt result.txt


    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
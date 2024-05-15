#!/usr/bin/bash
# Create: 2024-05-14 14:57:32
# Auther: hebinxin
# Description: A shellscript to check basenc command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# 环境准备
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    example_txt=$OET_PATH/example.txt
    encode_txt=$OET_PATH/encode.txt
    decode_txt=$OET_PATH/decode.txt
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    echo "Hello, world!" > $example_txt

    # 1. test basenc encode
    echo "Hello, world!" | basenc --base64
    CHECK_RESULT $? 0 0 "basenc --base64 error"

    # 2. test basenc decode
    echo "SGVsbG8sIHdvcmxkIQ==" | basenc --base64 --decode
    CHECK_RESULT $? 0 0 "basenc --base64 --decode error"

    basenc --base64 < $example_txt > $encode_txt
    CHECK_RESULT $? 0 0 "basenc --base64 file error"

    basenc --base64 --decode < $encode_txt > $decode_txt
    CHECK_RESULT $? 0 0 "basenc --base64 --decode file error"

}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    [ -e "$example_txt" ] && rm -rf $example_txt
    [ -e "$encode_txt" ] && rm -rf $encode_txt
    [ -e "$decode_txt" ] && rm -rf $decode_txt
    LOG_INFO "End to restore the test environment."
}

main $@
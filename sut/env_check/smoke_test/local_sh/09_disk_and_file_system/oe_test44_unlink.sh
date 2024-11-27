#!/usr/bin/bash
# author: gaoyanjun
# Create: 2024-11-25  
# Description: test the unlink command  

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
    # 创建一个测试文件
    TEST_FILE="/tmp/testfile.txt"
    echo "This is a test file." > $TEST_FILE
   
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."


    # Test basic functionality of unlink command
    unlink $TEST_FILE
    if [[ ! -f $TEST_FILE ]]; then
        CHECK_RESULT 0 0 0 "unlink command executed successfully"
    else
        CHECK_RESULT 1 0 0 "unlink command did not remove the file"
    fi

    # Test unlink with non-existent file
    result=$(unlink /tmp/nonexistentfile.txt 2>&1)
    if [[ $? -ne 0 ]] && [[ $result =~ "No such file or directory" ]]; then
        CHECK_RESULT 0 0 0 "unlink command correctly reports non-existent file"
    else
        CHECK_RESULT 1 0 0 "unlink command did not report error for non-existent file"
    fi

    # Check unlink --help option
    result=$(unlink --help 2>&1)
    if [[ $result =~ "Usage:" ]] || [[ $result =~ "用法:" ]]; then
        CHECK_RESULT 0 0 0 "unlink --help displays correct help information"
    else
        CHECK_RESULT 1 0 0 "unlink --help does not display correct help information"
    fi

    # Check unlink --version option
    result=$(unlink --version 2>&1)
    if [[ $result =~ "unlink " ]] || [[ $result =~ "Unlink " ]]; then
        CHECK_RESULT 0 0 0 "unlink --version displays version information"
    else
        CHECK_RESULT 1 0 0 "unlink --version does not display version information"
    fi




    LOG_INFO "Finish test!"



}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@

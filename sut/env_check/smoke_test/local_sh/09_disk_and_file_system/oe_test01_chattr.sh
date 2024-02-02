#!/usr/bin/bash
# Create: 2023-11-13 09:56:24
# Auther: hebinxin
# Description: A shellscript to check chattr command.

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
    file=$OET_PATH/oe_test01.txt
    test -e "$file" && rm -f $file
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    touch $file

    # 1. test chattr +a
    chattr +a $file
    str=$(lsattr $file | awk -F ' ' '{print $1}')
    [[ $str == *a* ]]
    CHECK_RESULT $? 0 0 "chattr +a error"
    chattr -a $file

    # 2. test chattr +i
    chattr +i $file
    str=$(lsattr $file | awk -F ' ' '{print $1}')
    [[ $str == *i* ]]
    CHECK_RESULT $? 0 0 "chattr +i error"
    chattr -i $file

    # 3. test chattr +u
    chattr +u $file
    str=$(lsattr $file | awk -F ' ' '{print $1}')
    [[ $str == *u* ]]
    CHECK_RESULT $? 0 0 "chattr +u error"
    chattr -u $file

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    test -e "$file" && rm -f $file
    LOG_INFO "End to restore the test environment."
}

main $@


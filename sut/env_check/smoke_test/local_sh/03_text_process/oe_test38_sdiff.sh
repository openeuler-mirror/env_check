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

    LOG_INFO "Start testing sdiff command..."

    echo -e "line1\nline2\nline3" > file1.txt
    echo -e "line1\nlineX\nline3" > file2.txt

    sdiff file1.txt file2.txt > result.txt
    grep -q "line2 | lineX" result.txt
    CHECK_RESULT $? 0 0 "sdiff default comparison failed"

    sdiff -s file1.txt file2.txt > result.txt
    grep -q "line2 | lineX" result.txt
    CHECK_RESULT $? 0 0 "sdiff -s option failed"

    rm -f file1.txt file2.txt

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
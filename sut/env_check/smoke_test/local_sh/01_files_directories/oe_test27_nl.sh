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
function run_nl_test() {
    LOG_INFO "Start testing nl..."

    echo -e "line 1\nline 2\nline 3" > test_file.txt

    nl test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl failed to add line numbers to file"

    nl -b t test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -b t failed to number only non-empty lines"

    nl -n rn test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -n rn failed to align line numbers to the right"

    nl -w 4 test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -w 4 failed to set line number width"

    nl -s " -> " test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -s failed to set separator between line number and text"

    nl -i 2 test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -i 2 failed to increment line numbers by 2"

    nl -v 5 test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -v 5 failed to set starting line number to 5"

    nl -p test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -p failed to keep page numbering continuous"

    nl -l 2 test_file.txt > nl_output.txt
    CHECK_RESULT $? 0 0 "nl -l 2 failed to set logical page length to 2 lines"

    rm -f test_file.txt nl_output.txt

    LOG_INFO "Finish testing nl!"
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
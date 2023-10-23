#!/usr/bin/bash
# author: wangdong
# Create: 2023-10-20  14:00
# Description: test the fmt command -- simple optimal text formatter

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
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {

    echo  "Start testing..."

    commands=("dnsdomainname" "doexec" "dumpkeys" "echo" "ed" "egrep" "env" "ex" "fase" "fgrep" "gawk")

    for cmd in "${commands[@]}"
    do
    	echo "$cmd" >> /tmp/text_file1
    done

    CHECK_RESULT $?

    cat /tmp/text_file1
    CHECK_RESULT $?	
    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -r /tmp/test_file1	
    LOG_INFO "Finish environment cleanup!"
}

main $@

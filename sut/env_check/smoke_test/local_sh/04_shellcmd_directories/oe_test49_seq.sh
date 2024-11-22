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

    LOG_INFO "Start testing seq..."

    seq 5 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq 5 failed to generate a sequence from 1 to 5"

    seq 3 7 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq 3 7 failed to generate a sequence from 3 to 7"

    seq 1 2 10 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq 1 2 10 failed to generate a sequence from 1 to 10 with step 2"

    seq 10 -1 5 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq 10 -1 5 failed to generate a sequence from 10 to 5 with step -1"

    seq -w 1 3 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq -w 1 3 failed to generate zero-padded sequence"

    seq -s ", " 1 5 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq -s ', ' 1 5 failed to use custom separator"

    seq -f "%03g" 1 5 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq -f '%03g' 1 5 failed to format sequence with leading zeros"

    seq 1 10000 > seq_output.txt
    CHECK_RESULT $? 0 0 "seq 1 10000 failed to generate a large sequence"

    LOG_INFO "Finish testing seq!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -f seq_output.txt
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
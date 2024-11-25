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

    LOG_INFO "Start testing..."

    echo "Hello, World!" | tee /tmp/output.txt > /dev/null
    CHECK_RESULT $? 0 0 "tee basic usage failed to write output to file"

    echo "Additional text" | tee -a /tmp/output.txt > /dev/null
    CHECK_RESULT $? 0 0 "tee -a option failed to append output to file"

    echo "Multi-file output" | tee /tmp/output1.txt /tmp/output2.txt > /dev/null
    CHECK_RESULT $? 0 0 "tee failed to write output to multiple files"

    echo "Piped text" | tee /tmp/output_pipe.txt | grep -q "Piped text"
    CHECK_RESULT $? 0 0 "tee failed to pass output through pipeline"

    echo "" | tee /tmp/empty.txt > /dev/null
    CHECK_RESULT $? 0 0 "tee failed to handle empty input"

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -f /tmp/output.txt /tmp/output1.txt /tmp/output2.txt /tmp/output_pipe.txt /tmp/empty.txt
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
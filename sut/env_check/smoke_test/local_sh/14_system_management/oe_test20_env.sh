#!/usr/bin/bash

# Create: 2024-10-31
# Author: wangbo

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
    LOG_INFO "Start testing..."

    env > /tmp/env_output.txt
    CHECK_RESULT $?
    test -s /tmp/env_output.txt
    CHECK_RESULT $?

    env TEST_VAR="Hello" bash -c 'echo $TEST_VAR' > /tmp/env_custom_var.txt
    CHECK_RESULT $?
    grep "Hello" /tmp/env_custom_var.txt
    CHECK_RESULT $?

    export TEMP_VAR="Temporary"
    env -u TEMP_VAR bash -c 'echo ${TEMP_VAR:-unset}' > /tmp/env_unset_var.txt
    CHECK_RESULT $?
    grep "unset" /tmp/env_unset_var.txt
    CHECK_RESULT $?

    export OUTER_VAR="OuterValue"
    env -i bash -c 'echo ${OUTER_VAR:-not_set}' > /tmp/env_isolated.txt
    CHECK_RESULT $?
    grep "not_set" /tmp/env_isolated.txt
    CHECK_RESULT $?

    env /bin/echo "Hello, World!" > /tmp/env_echo_test.txt
    CHECK_RESULT $?
    grep "Hello, World!" /tmp/env_echo_test.txt
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    rm -f /tmp/env_*.txt
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

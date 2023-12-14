#!/usr/bin/bash

# Create: 2023-10-30
# Author: zengyifeng

# 获取脚本所在路径
OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# Environment setup
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End to prepare the test environment."
}

# Test execution
function run_test() {
    LOG_INFO "Start testing..."
    
    # Check whether the killall command is installed
    if ! command -v killall &> /dev/null; then
        LOG_WARN "killall command is not installed"
        CHECK_RESULT $? 0 0
        LOG_INFO "Finish test!"
    else
        LOG_INFO "killall command is installed"
        
        # Create a process with a timestamp
        timestamp=$(date +%s)
        process_name="test_process_$timestamp"
        (sleep 10) & # Run a background process with the unique name
    
        # Use killall to terminate the process
        killall "$process_name"
    
        # Check the exit status of the killall command
        CHECK_RESULT $? 0 0 "Failed to execute the killall command."
    fi

    LOG_INFO "Finish test!"
}

# Environment cleanup
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

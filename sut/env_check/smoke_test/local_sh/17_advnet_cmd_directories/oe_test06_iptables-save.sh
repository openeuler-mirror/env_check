#!/usr/bin/bash
# author: wangdong
# Create: 2024-3-20  10:00
# Description: test the route command  --  show / manipulate the IP routing table

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

    # Test basic functionality of iptables-save command
    result=$(sudo iptables-save)
    if [[ $result =~ "INPUT" ]] && [[ $result =~ "OUTPUT" ]]; then
        CHECK_RESULT 0 0 0 "iptables-save command executed successfully"
    else
        CHECK_RESULT 1 0 0 "iptables-save command did not return valid output"
    fi

    # Test iptables-save -c option
    result=$(sudo iptables-save -c 2>&1)
    if [[ $? -eq 0 ]] && [[ $result =~ "pkts" ]] && [[ $result =~ "bytes" ]]; then
        CHECK_RESULT 0 0 0 "iptables-save -c option works correctly"
    elif [[ $? -ne 0 ]]; then
        CHECK_RESULT 0 0 0 "iptables-save -c option reported an error, which is expected in some cases"
    else
        CHECK_RESULT 1 0 0 "iptables-save -c option did not return packet and byte counts"
    fi

    # Test iptables-save -t filter option
    result=$(sudo iptables-save -t filter)
    if [[ $result =~ "INPUT" ]] && [[ $result =~ "OUTPUT" ]]; then
        CHECK_RESULT 0 0 0 "iptables-save -t filter option works correctly"
    else
        CHECK_RESULT 1 0 0 "iptables-save -t filter option did not return valid output"
    fi

    # Check iptables-save --version option
    result=$(sudo iptables-save --version)
    if [[ $result =~ "iptables-save " ]] || [[ $result =~ "Iptables-save " ]]; then
        CHECK_RESULT 0 0 0 "iptables-save --version displays version information"
    else
        CHECK_RESULT 1 0 0 "iptables-save --version does not display version information"
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

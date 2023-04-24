#!/usr/bin/bash

function LOG_INFO() {
    message=$1
    echo -e "\033[32m [INFO] $message \t$1\t$2\033[0m"
}

function LOG_ERROR() {
    message=$1
    echo -e "\033[31m [ERROR] $message \t$1\t$2\033[0m"
}

function LOG_WARN() {
    message=$1
    echo -e "\033[33m [WARN] $message \t$1\t$2\033[0m"
}

function LOG_DEBUG() {
    message=$1
    echo -e "\033[36m [DEBUG] $message \t$1\t$2\033[0m"
}

# 结果检查
function CHECK_RESULT() {
    actual_result=$1
    expect_result=${2-0}
    mode=${3-0}
    error_log=$4
    exit_mode=${5-0}

    if [ -z "$actual_result" ]; then
        LOG_ERROR "Missing actual error code."
        return 1
    fi
    # 获取脚本执行结果
    # 成功
    if [ $mode -eq 0 ]; then
        test "$actual_result"x != "$expect_result"x && {
            test -n "$error_log" && LOG_ERROR "$error_log"
            ((exec_result++))
            LOG_ERROR "${BASH_SOURCE[1]} line ${BASH_LINENO[0]}"
	    if [ $exit_mode -eq 1 ]; then
                    exit 1;
            fi
        }
    # 失败
    else
        test "$actual_result"x == "$expect_result"x && {
            test -n "$error_log" && LOG_ERROR "$error_log"
            ((exec_result++))
            LOG_ERROR "${BASH_SOURCE[1]} line ${BASH_LINENO[0]}"
	    if [ $exit_mode -eq 1 ]; then
                    exit 1;
            fi
        }
    fi

    return 0
}
# 执行用例
function CASE_RESULT() {
    case_result=$1
    test -z "$exec_result" && {
        # 成功
        test $case_result -eq 0 && {
            LOG_INFO "succeed to execute the case."
            exec_result=""
            exit 0
        }
        LOG_ERROR "failed to execute the case."
        exit $case_result
    }
    # 失败
    test $exec_result -gt 0 && {
        LOG_ERROR "failed to execute the case."
        exit $exec_result
    }
    LOG_INFO "succeed to execute the case."
    exit $exec_result
}

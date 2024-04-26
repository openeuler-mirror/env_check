#!/usr/bin/bash
# Create: 2024-04-25 14:18:07
# Auther: wangdong
# Description:    auditd - The Linux Audit daemon
# auditd 是 Linux 系统中的一个用户空间守护进程，它负责将审计记录写入磁盘

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
    # 创建测试文件
    touch /tmp/testfile
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    # 检查 auditctl 命令是否安装。
    if ! command -v auditd &> /dev/null; then
        LOG_WARN "auditd command is not installed"
        CHECK_RESULT $? 0 0
    fi

    # 检查 auditd 服务是否处于活动状态。
    if systemctl is-active --quiet auditd; then
        LOG_INFO "auditd service is active."
    else
        LOG_WARN "auditd service is not active."
        CHECK_RESULT $? 0 1
    fi

    # 测试添加和删除规则
    #add_rule_result=$(sudo auditctl -w /tmp/testfile -p wa -k testkey)
    #LOG_INFO "Adding audit rule: $add_rule_result"
    #CHECK_RESULT $add_rule_result

    # 确认规则是否添加成功
    #if sudo auditctl -l | grep -q "/tmp/testfile.*watch.*key=testkey"; then
    #    LOG_INFO "Rule added successfully."
    #else
    #    LOG_WARN "Failed to add rule."
    #    CHECK_RESULT $? 0 1
    #fi

    # 删除规则
    #remove_rule_result=$(sudo auditctl -W /tmp/testfile -k testkey)
    #LOG_INFO "Removing audit rule: $remove_rule_result"
    #CHECK_RESULT $remove_rule_result

    # 确认规则是否删除成功
    #if sudo auditctl -l | grep -q "/tmp/testfile.*watch.*key=testkey"; then
    #    LOG_WARN "Failed to remove rule."
    #    CHECK_RESULT $? 0 1
    #else
    #    LOG_INFO "Rule removed successfully."
    #fi
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -f /tmp/testfile
    LOG_INFO "End to restore the test environment."
}

main $@

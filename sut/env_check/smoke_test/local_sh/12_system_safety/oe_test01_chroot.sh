#!/bin/bash

# Create: 2023-12-18
# Author: zengyifeng
# Description: Test script for chroot command.

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"

# ����׼��
function pre_test() {
    LOG_INFO "Start to prepare the test environment."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    
    # ����һ����������Ĳ���Ŀ¼
    test_dir="/tmp/chroot_test_$(date +%s)"
    mkdir -p "$test_dir"
    
    
    # �ڲ���Ŀ¼�д���һ���ļ�
    echo "Hello, Chroot!" > "$test_dir/test_file"
    
    LOG_INFO "End to prepare the test environment."
}

# ����ִ��
function run_test() {
    LOG_INFO "Start testing..."
    
    # ���� /bin/bash ������Ŀ¼
    cp /bin/bash "$test_dir"
    
    # ʹ��chroot�����л�������Ŀ¼��ִ������
    #chroot "$test_dir" bin/bash -c "cat test_file"
    chroot / bin/bash -c "cat '$test_dir/test_file'"
    
    # ���chroot�����Ƿ�ɹ�ִ��
    CHECK_RESULT $? 0 0 "Failed to execute chroot command."
    
    # ����chroot�����--help����
    chroot --help | grep -E "Usage|�÷�"
    CHECK_RESULT $? 0 0 "Failed to execute 'chroot --help'."
    
    # ����chroot�����--version����
    chroot --version
    CHECK_RESULT $? 0 0 "Failed to execute 'chroot --version'."
    
    LOG_INFO "Finish test!"
}

# ��������
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # ɾ������Ŀ¼
    rm -rf "$test_dir"
    
    LOG_INFO "End to restore the test environment."
}

main $@

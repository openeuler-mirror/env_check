#!/bin/bash

# Create: 2023-12-18
# Author: zengyifeng
# Description: Test script for sftp command.

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
    
    # 创建一个随机命名的测试目录
    test_dir="/tmp/sftp_test_$(date +%s)"
    mkdir -p "$test_dir"
    
    # 在测试目录中创建一个文件
    echo "Hello, SFTP!" > "$test_dir/test_file"
    
    # 创建一个用于sftp的临时用户
    sftp_user="sftp_user_$(date +%s)"
    useradd "$sftp_user" -m -s /bin/bash
    
    mkdir -p "/home/$sftp_user/.ssh"
    
    # 创建密钥对，无密码登录
    ssh-keygen -t rsa -f "/home/$sftp_user/.ssh/id_rsa" -N ""
    cat "/home/$sftp_user/.ssh/id_rsa.pub" > "/home/$sftp_user/.ssh/authorized_keys"
    
    chmod 755 "/home/$sftp_user/.ssh"
    chmod 600 "/home/$sftp_user/.ssh/id_rsa"
    chmod 700 "/home/$sftp_user"
    
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    
    # 检查sshd服务是否已经启动
    systemctl is-active --quiet sshd
    if [ $? -ne 0 ]; then
        # 如果sshd服务未启动，则打印警告信息并结束测试
        LOG_WARN "sshd service is not running. Skipping sftp test."
        # 测试sftp命令的--help参数
        sftp --help | grep -E "Usage|用法"
        CHECK_RESULT $? 0 0 "Failed to execute 'sftp --help'."
    else
        # 使用sftp上传文件
        local_file="$test_dir/test_file"
        #remote_file="/upload_file" 会出现 remote open("/upload_file"): Permission denied 的报错！
        remote_file="upload_file"
        sftp -o StrictHostKeyChecking=no -o PasswordAuthentication=no -i "/home/$sftp_user/.ssh/id_rsa" "$sftp_user@localhost" <<EOF
put "$local_file" "$remote_file"
EOF
      
        # 检查上传是否成功
        CHECK_RESULT $? 0 0 "Failed to upload file using sftp."
      
        # 使用sftp下载文件
        downloaded_file="$test_dir/downloaded_file"
        sftp -o StrictHostKeyChecking=no -o PasswordAuthentication=no -i "/home/$sftp_user/.ssh/id_rsa" "$sftp_user@localhost" <<EOF
get "$remote_file" "$downloaded_file"
EOF
      
        # 检查下载是否成功
        CHECK_RESULT $? 0 0 "Failed to download file using sftp."
      
        # 检查下载的文件内容是否一致
        diff "$local_file" "$downloaded_file"
        CHECK_RESULT $? 0 0 "Downloaded file content does not match the original file."
    fi
    
    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    
    # 删除测试目录
    rm -rf "$test_dir"
    
    # 删除sftp用户
    userdel -r "$sftp_user"
    
    LOG_INFO "End to restore the test environment."
}

main $@

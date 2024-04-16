#!/usr/bin/bash
# Create: 2024-4-15 09:38:56
# Auther: wangdong
# Description:  addgnupghome - Create .gnupg home directories
# GnuPG是一个用于加密和解密数据的工具，它遵循OpenPGP标准。在Linux系统中，您可以通过修改环境变量来指定GnuPG的home目录。

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

    which addgnupghome
    CHECK_RESULT $?

    rpm -qf /usr/sbin/addgnupghome
    CHECK_RESULT $?

    # 创建新的GnuPG home目录
    #mkdir  ~/.gnupg
    # 生成密钥对
    #gpg --homedir  ~/.gnupg  --gen-key
    # 配置环境变量
    #echo "export GNUPGHOME=~/.gnupg" > ~/.bashrc   写入~/.bashrc
    #source ~/.bashrc
    #验证   查看密钥
    gpg --homedir ~/.gnupg  --list-keys   
    CHECK_RESULT $?

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

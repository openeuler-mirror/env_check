#!/usr/bin/bash
# Create: 2024-08-2  16:00:07
# Auther: wangdong
#  build-locale-archive  

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
    # 检查 buildlocalearchive 命令是否安装。
    if ! command -v build-locale-archive &> /dev/null; then
        LOG_WARN "buildlocalearchive command is not installed"
        CHECK_RESULT $? 0 0
    fi

#   [root@cmcc-oe21 06_basic_commands]# build-locale-archive  -h
# Usage: build-locale-archive [OPTION]... [TEMPLATE-FILE] [ARCHIVE-FILE]
# Builds a locale archive from a template file.
# Options:
#  -h, --help                 Print this usage message.
#  -v, --verbose              Verbose execution.
#  -l, --install-langs=LIST   Only include locales given in LIST into the 

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash -x

# Create: 2024-10-30
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
    LOG_INFO "Start testing......"

    # 创建目录结构并检查
    mkdir -p /tmp/testdir1/testdir2/testdir3
    CHECK_RESULT $?
    rmdir -p --ignore-fail-on-non-empty /tmp/testdir1

    # 使用带有 -m 参数的 mkdir 来指定权限
    mkdir -m 755 /tmp/testdir2
    CHECK_RESULT $?

    # 确认目录存在并检查权限
    test -d /tmp/testdir2
    CHECK_RESULT $?

    stat -c "%a" /tmp/testdir2 | grep 755
    CHECK_RESULT $?
    rmdir -p --ignore-fail-on-non-empty /tmp/testdir2


    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    rm -rf /tmp/testdir1 /tmp/testdir2
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
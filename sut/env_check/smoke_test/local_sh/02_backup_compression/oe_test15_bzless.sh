#!/usr/bin/bash -x

# Create: 2024-10-31

# bzless命令 – 查看bzip2压缩过的文本文件的内容

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
    echo "hello abc 123" > /tmp/t1
    bzip2 -k  /tmp/t1		# 生成/tmp/t1.bz2
    LOG_INFO "End to prepare the test environment."
}
# 用例执行
function run_test() {
    LOG_INFO "Start testing..."
    # 检查 bzless 命令是否存在
    if ! command -v bzless &>/dev/null; then
        LOG_WARN "bzless command is not installed"
        CHECK_RESULT $? 0 0 "bzless command is required for this test."
    else
        bzless --help
        CHECK_RESULT $? 0 0 "Failed to execute 'bzless --help'."
       
	echo q | bzless /tmp/t1.bz2 2>&1 | grep -q "abc"
	CHECK_RESULT $?
    fi    

    LOG_INFO "Finish test!"
}
# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    rm -rf /tmp/t1.tar.gz2
    LOG_INFO "End to restore the test environment."
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2024-11-27  14:30
# Description: fsck -- fsck 是用于检查和修复 Linux 文件系统的工具。

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
    # 检查 readelf 命令是否存在
    if ! command -v readelf &>/dev/null; then
        LOG_WARN "readelf command is not installed"
        CHECK_RESULT $? 0 0 "readelf command is required for this test."
    else
		fsck -h
    	CHECK_RESULT $? 

		# 设置临时文件名
		TEMP_DISK=temp_disk.img
		MOUNT_POINT=/mnt/temp_mount

		# 创建一个 100MB 的临时文件
		dd if=/dev/zero of=$TEMP_DISK bs=1M count=100

		# 在临时文件上创建 ext4 文件系统
		mkfs.ext4 $TEMP_DISK

		# 创建挂载点
		mkdir -p $MOUNT_POINT

		# 挂载临时文件系统
		sudo mount -o loop $TEMP_DISK $MOUNT_POINT

		# 向文件系统中添加一些文件以模拟使用
		touch $MOUNT_POINT/testfile1
		touch $MOUNT_POINT/testfile2

		# 卸载文件系统
		sudo umount $MOUNT_POINT

		# 运行 fsck 检查
		echo "Running fsck on the temporary file system..."
		sudo fsck.ext4 -f $TEMP_DISK
    	CHECK_RESULT $? 
    fi
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
	# 清理
	rm -f $TEMP_DISK
	rmdir $MOUNT_POINT
    LOG_INFO "Finish environment cleanup!"
}

main $@

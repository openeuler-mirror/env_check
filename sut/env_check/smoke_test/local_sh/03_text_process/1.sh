#!/bin/bash

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

# 清理
rm -f $TEMP_DISK
rmdir $MOUNT_POINT

echo "Test completed."

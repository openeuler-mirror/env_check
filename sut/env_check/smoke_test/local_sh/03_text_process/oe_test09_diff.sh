#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-18  10:40
# Description: test the diff commmand - compare files line by line

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

	echo  "Start testing..."

	# 创建测试用的文件夹
	mkdir /tmp/test_folder
	cd /tmp/test_folder

	# 创建文件1
	echo "This is file 1" > file1.txt

	# 创建文件2，与文件1内容相同
	echo "This is file 1" > file2.txt

	# 创建文件3，与文件1内容不同
	echo "This is different content" > file3.txt

	# 创建文件4，为空文件
	touch file4.txt

	# 创建文件5，包含特殊字符
	echo "Line 1" > file5.txt
	echo "Line 2 & 3" >> file5.txt
	echo "Line 4" >> file5.txt

	# 复制文件5为文件6，内容相同
	cp file5.txt file6.txt

	# 创建文件7，与文件5内容不同
	echo "Different content" > file7.txt

	# 复制文件1为文件8，内容相同
	cp file1.txt file8.txt

	# 复制文件1为文件9，但权限不同
	cp file1.txt file9.txt
	chmod 600 file9.txt

	# 复制文件1为文件10，但时间戳不同
	cp file1.txt file10.txt
	touch -d "yesterday" file10.txt

	# 使用diff比较文件
	diff file1.txt file2.txt
	diff file1.txt file3.txt
	diff file1.txt file4.txt
	diff file5.txt file6.txt
	diff file5.txt file7.txt
	diff file1.txt file8.txt
	diff file1.txt file9.txt
	diff file1.txt file10.txt

	#比较两个文件是否不同
	diff -q file1.txt file2.txt

	#比较两个文件并显示差异
	diff fiel1.txt file2.txt

    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -r /tmp/test_folder	
    LOG_INFO "Finish environment cleanup!"
}

main $@

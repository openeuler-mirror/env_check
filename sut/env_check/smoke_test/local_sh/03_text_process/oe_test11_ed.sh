#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-22  14:00
# Description: test the ed commmand - line-oriented text editor

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)

source "$OET_PATH/../common/common_lib.sh"

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
	
	#
	# 测试用例1: 创建一个新文件并插入文本
	echo "Test Case 1: Create a new file and insert text"
	echo -e "a\nThis is line 1.\nThis is line 2.\n.\nw" | ed -s testfile.txt

	# 测试用例2: 在文件中追加文本
	echo "Test Case 2: Append text to the file"
	echo -e "a\nThis is line 3.\nThis is line 4.\n.\nw" | ed -s testfile.txt

	# 测试用例3: 在指定行插入文本
	echo "Test Case 3: Insert text at a specific line"
	echo -e "3i\nThis is a new line at line 3.\n.\nw" | ed -s testfile.txt

	# 测试用例4: 删除指定行
	echo "Test Case 4: Delete a specific line"
	echo -e "2d\nw" | ed -s testfile.txt

	# 测试用例5: 查看文件内容
	echo "Test Case 5: View the file content"
	echo -e "1,$p\nq" | ed -s testfile.txt

	# 清理：删除测试文件
	rm testfile.txt


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

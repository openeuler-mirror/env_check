#!/usr/bin/bash
# author: wangdong
# Create: 2024-1-5  14:30
# Description: test the vi command -- screen-oriented (visual) display editor

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
    echo "Start test!"

	echo -e "Testing Vi command: Open Vi editor\n"
	# 测试用例1：打开Vi编辑器
	which vi 
    CHECK_RESULT $?
	
	mkdir -p /tmp/test001
	echo "123456  100001" >> /tmp/test001/test_file.txt
	echo "123457  100002" >> /tmp/test001/test_file.txt
	echo "123458  100003" >> /tmp/test001/test_file.txt

	# 测试用例2：在Vi编辑器中插入文本
	echo -e "\nTesting Vi command: Insert text\n"
	echo -e "This is a test file\n" | vi -c "normal G" -c "normal o" -c "startinsert" -c "wq" /tmp/test001/test_file.txt
    CHECK_RESULT $?

	# 测试用例3：保存并退出Vi编辑器
	echo -e "\nTesting Vi command: Save and quit\n"
	echo -e "This is a test file\n" | vi -c "wq" /tmp/test001/test_file.txt
    CHECK_RESULT $?

	# 测试用例4：放弃更改并退出Vi编辑器
	echo -e "\nTesting Vi command: Quit without saving\n"
	echo -e "This is a test file\n" | vi -c "q!" /tmp/test001/test_file.txt
    CHECK_RESULT $?

	# 测试用例5：在Vi编辑器中查找文本
	echo -e "\nTesting Vi command: Search text\n"
	echo -e "This is a test file\n" | vi -c "/test" -c "n" -c "n" -c "q!" /tmp/test001/test_file.txt
    CHECK_RESULT $?
}

# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf /tmp/test001
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-18  15:50
# Description: test the diffstat commmand - make histogram from diff-output

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

	mkdir -p /tmp/test_folder/test
    echo "123" > /tmp/test_folder/test/1.txt
    echo "ABC" > /tmp/test_folder/test2/1.txt

	#使用diff指令比较两个目录的差异，并通过diffstat指令输出统计信息
	diff /tmp/test_folder/test/   /tmp/test_folder/test2/ | diffstat

	#使用diffstat指令输出patch补丁文件的统计信息
	git clone https://gitee.com/anolis/sysom.git
	cd sysom
	git format-patch -1 | cat *.patch > 1.patch
	diffstat 1.patch


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

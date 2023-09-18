#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-15  14:35
# Description: test the diff3 commmand - compare three files line by line

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
	echo "Test Case 1: Basic Usage"
	#创建了三个文件，然后使用diff3命令比较它们，将结果输出到result.txt文件中。
	echo "File1 Content" > file1.txt
	echo "File2 Content" > file2.txt
	echo "File3 Content" > file3.txt
	diff3 file1.txt file2.txt file3.txt > result.txt
	cat result.txt


	#在file1.txt中制造了一个冲突，然后使用diff3命令来查看冲突解决。
	echo "Test Case 2: Conflict Resolution"
	echo "File1 Content" > file1.txt
	echo "File2 Content" > file2.txt
	echo "File3 Content" > file3.txt
	echo "Conflict in File1" >> file1.txt
	diff3 file1.txt file2.txt file3.txt > result.txt
	cat result.txt

	#合并无冲突的文件：
	echo "Test Case 3: Merging Non-Conflict Files"
	echo "File1 Content" > file1.txt
	echo "File2 Content" > file2.txt
	echo "File3 Content" > file3.txt
	diff3 file1.txt file2.txt file3.txt > result.txt
	cat result.txt
 

	#使用不同的分隔符测试：
	echo "Test Case 5: Using Different Delimiters"
	echo "File1:Content" > file1.txt
	echo "File2-Content" > file2.txt
	echo "File3;Content" > file3.txt
	diff3 -m file1.txt file2.txt file3.txt > result.txt
	cat result.txt


    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf file*.txt   result*.txt
    LOG_INFO "Finish environment cleanup!"
}

main $@

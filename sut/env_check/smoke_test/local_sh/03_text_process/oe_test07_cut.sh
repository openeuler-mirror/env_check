#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-15  14:35
# Description: test the cut commmand - remove sections from each line of files

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

    #基本用法-使用逗号作为分隔符，从名为test1.txt的文本文件中提取第2到最后一个字段（包括第2个字段）
    cut -d',' -f2- file1.txt
    cat file1.txt


	#指定不同的分隔符 - 使用制表符：
	echo -n > file2.txt
	echo "Alice 25" >> file2.txt
	echo "Eve 30" >> file2.txt	
	cat file2.txt
	cut -d' ' -f2 file2.txt > result.log && cat result.log



	#切割固定字符宽度 - 使用-c选项：
	echo -n > file3.txt
	echo "123456789" >> file3.txt
	cut -c2-5 file3.txt  > result2.log && cat result2.log

	#指定输出分隔符 - 不支持-o选项  ：
	echo -n > file4.txt
	echo "Amy,35" >> file4.txt
	# cut -d',' -f1 -o':' file4.txt > result3.log && cat result3.log
	cut -d',' -f1  file4.txt | tr ',' ':' > result3.log && cat result3.log

    #切割标准输入 - 使用管道：
	echo "Red,Green,Blue" | cut -d',' -f2


	#使用字符范围 - 使用-选项
	echo "ABCDEFGHIJKLMNOPQRSTUVWXYZ" > file5.txt
	cut -c5-10 file5.txt


	#逆序切割 - 使用--complement选项：
	echo "One Two Three Four" >> file6.txt
	cut -d' ' -f2- --complement file6.txt


	#跳过行 - 使用-s选项：
	echo "Apple" >> file7.txt
	echo "Orange" >> file7.txt
	echo "Banana" >> file7.txt

	cut -d',' -f2 -s file7.txt

	#多个分隔符 - 使用多个-d选项：
	echo "A=B:C;D=E" >> file8.txt
	cut -d'=' -d':' -d';' -f2 file8.txt


	#处理大文件 - 使用--output-delimiter选项：
	echo "Large,File,Processing" >> file9.txt
	cut -d',' -f1,3 --output-delimiter='|' file9.txt


    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf file*.txt result*.log 
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-08  17:10 
# Description: test the command colrm - remove columns from a file

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
    
    #!/bin/bash

    # 创建两个示例文件
	cat <<EOF > file1.txt
	apple
	banana
	cherry
	date
	grape

EOF

	cat <<EOF > file2.txt
	banana
	cherry
	fig
	grape
	kiwi
EOF

	# 输出文件1和文件2的内容
	echo "文件1内容："
	cat file1.txt

	echo "文件2内容："
	cat file2.txt

	# 例1: 输出文件1和文件2的交集
	echo "例1: 输出文件1和文件2的交集："
	comm -12 file1.txt file2.txt

	# 例2: 输出只在文件1中的行
	echo "例2: 输出只在文件1中的行："
	comm -23 file1.txt file2.txt

	# 例3: 输出只在文件2中的行
	echo "例3: 输出只在文件2中的行："
	comm -13 file1.txt file2.txt

	# 例4: 用标志字符分隔输出
	echo "例4: 用标志字符分隔输出："
	comm -12 -t '|' file1.txt file2.txt

	# 创建两个示例文件，其中一个文件为空
	touch empty_file.txt

	# 例5: 测试一个文件为空
	echo "例5: 测试一个文件为空："
	comm -12 file1.txt empty_file.txt

	# 例6: 测试两个文件都为空
	echo "例6: 测试两个文件都为空："
	comm -12 empty_file.txt empty_file.txt

	# 创建一个示例文件，其中包含重复行
	cat <<EOF > file3.txt
	apple
	banana
	banana
	cherry
	cherry
EOF

	# 例7: 测试文件中包含重复行
	echo "例7: 测试文件中包含重复行："
	comm -12 file1.txt file3.txt

	# 例8: 输出不匹配的行
	echo "例8: 输出不匹配的行："
	comm -3 file1.txt file2.txt

	# 例9: 忽略空白行
	echo "例9: 忽略空白行："
	comm -3 -i file1.txt file2.txt

	# 例10: 指定自定义排序
	echo "例10: 指定自定义排序："
	comm -12 <(sort file1.txt) <(sort file2.txt)

    echo "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf testfile.txt
    LOG_INFO "Finish environment cleanup!"
}

main $@

#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-12  14:50 
# Description: test the command csplit - split a file into sections determined by context lines

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

	# 创建一个示例文件
	cat <<EOF > sample.txt
	SERVER-1
	[con] 10.10.10.1 suc
	[con] 10.10.10.2 fai
	[dis] 10.10.10.3 pen
	[con] 10.10.10.4 suc
	SERVER-2
	[con] 10.10.10.5 suc
	[con] 10.10.10.6 fai
	[dis] 10.10.10.7 pen
	[con] 10.10.10.8 suc
	SERVER-3
	[con] 10.10.10.9 suc
	[con] 10.10.10.10 fai
	[dis] 10.10.10.11 pen
	[con] 10.10.10.12 suc
EOF
	
	#分割sample.txt为2个以text_前缀开头的文件
	csplit sample.txt 2  -f text_

	#查看分割后的文件内容
	cat text_01
	cat text_01

	#将sample.txt分割成server1.log、server2.log、server3.log，这些文件的内容分别取自原文件中不同的SERVER部分
	cp sample.txt server.log
	csplit server.log /SERVER/ -n2 -s {*} -f server -b "%02d.log"; rm server00.log
	#查看文件
	cat server01.log
	cat server02.log
	cat server03.log

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf sample.txt  server.log  server01.log  server02.log server03.log 
    LOG_INFO "Finish environment cleanup!"
}

main $@

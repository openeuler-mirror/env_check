#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-28  17:15
# Description: test the ex command -- Vi IMproved, a programmer's text editor

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

	mkdir -p /tmp/test_folder
	# test1
	if command -v ex &>/dev/null;then
		echo "Ex or vi is already installed."
	else
		sudo yum install vim-minimal -y 
		if [ $? -eq 0 ]; then
			echo "Ex installed success."
		else
			exit 1
		fi
	fi

	# test2
	which ex
	CHECK_RESULT $?	

	#test3
	ex --version
	CHECK_RESULT $?	

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

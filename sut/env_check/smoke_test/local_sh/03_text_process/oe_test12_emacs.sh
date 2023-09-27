#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-27  16:00
# Description: test the emacs command -- an extensible,customizable free text editor

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
	if command -v emacs &>/dev/null;then
		echo "Emacs is already installed."
	else
		sudo yum install emacs -y 
		if [ $? -eq 0 ]; then
			echo "Emacs installed success."
		else
			exit 1
		fi
	fi

	# test2
	emacs /etc/passwd &
	CHECK_RESULT $?	

	sleep 5
	killall emacs

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

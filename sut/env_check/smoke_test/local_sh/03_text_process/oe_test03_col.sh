#!/usr/bin/bash
# author: wangdong
# Create: 2023-09-08  15:50 
# Description: test the col command - filter reverse line feeds from input

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

	 LOG_INFO "Start testing..."

    #基本用法：使用col命令处理一个包含控制字符的文本文件，查看它如何去除控制字符。
    echo -e "This is a text file with control characters.\nLine 1\nLine 2\nLine 3\nTab\tCharacter" > control_chars.txt
    col -b < control_chars.txt
    CHECK_RESULT $?

    #处理包含ANSI颜色代码的文件：如果您有一个包含ANSI颜色代码的文件，可以使用col命令来去除这些代码，以便在终
#端上查看文本内容。
    echo -e "\033[31mThis is red text.\033[0m\n\033[32mThis is green text.\033[0m\n\033[34mThis is blue text.\033[0m" > colorfulfile.txt
    cat colorfulfile.txt | col -b > cleanfile.txt
    CHECK_RESULT $?

    #显示带有退格符的文本：测试col命令是否能够处理包含退格符（\b）的文本。
    echo -e "Hello\bWorld" | col -b


    #与其他命令组合使用：将col与其他文本处理命令一起使用，例如grep和sed。
	echo "123456abcedfg" > input.txt
    cat input.txt | grep "pattern" | col -b

    #处理包含制表符的文本：测试col命令是否能够正确处理包含制表符的文本。
    echo -e "Name\tAge\nJohn\t30\nAlice\t25" | col -b

    #处理包含换行符的文本：尝试处理包含多个连续换行符的文本。
    echo -e "Line 1\n\n\nLine 2" | col -b

    #使用-p选项：尝试使用col命令的-p选项，查看其效果。
    echo -e "Some \vVertical \tTab Text" | col -bp

    #处理包含退格和回车符的文本：测试col命令是否能够正确处理包含退格和回车符的文本。
    echo -e "Hello\b\b\bWorld\r\r" | col -b

    #将处理结果重定向到文件：将col命令处理后的文本内容保存到一个新文件中。
    col -b < input.txt > outputfile
    CHECK_RESULT $?

    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    rm -rf  input.txt   outputfile   cleanfile.txt  control_chars.txt
    LOG_INFO "Finish environment cleanup!"
}

main $@

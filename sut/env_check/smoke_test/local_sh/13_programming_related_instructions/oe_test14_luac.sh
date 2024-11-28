#!/usr/bin/bash -x

# Create: 2024-11-28
# Auther: wangbo
# build-locale-archive

OET_PATH=$(
    cd "$(dirname "$0")" || exit 1
    pwd
)
source "$OET_PATH/../../common/common_lib.sh"
# 环境准备
function pre_test() {
    LOG_INFO "Start environment preparation."
    OLD_LANG=$LANG
    export LANG=en_US.UTF-8
    LOG_INFO "End of environmental preparation!"
}
# 用例执行
function run_test() {

    LOG_INFO "Start testing..."

    luac -v > result.txt 2>&1
    CHECK_RESULT $? 0 0 "luac -v command failed"
    grep -q "Lua" result.txt
    CHECK_RESULT $? 0 0 "luac -v output is incorrect"

    echo 'print("Hello, Luac!")' > test.lua
    luac -o test.luac test.lua
    CHECK_RESULT $? 0 0 "luac failed to compile Lua script"
    CHECK_FILE_EXISTS test.luac "Compiled file test.luac does not exist"
    rm -f test.luac

    luac -o compiled_output.luac test.lua
    CHECK_RESULT $? 0 0 "luac -o command failed"
    CHECK_FILE_EXISTS compiled_output.luac "Output file compiled_output.luac does not exist"
    rm -f compiled_output.luac

    luac -l test.lua > result.txt 2>&1
    CHECK_RESULT $? 0 0 "luac -l command failed"
    grep -q "main <test.lua>" result.txt
    CHECK_RESULT $? 0 0 "luac -l output is incorrect"

    luac -p test.lua
    CHECK_RESULT $? 0 0 "luac -p command failed"

    echo 'print("Unclosed string' > invalid.lua
    luac -p invalid.lua > result.txt 2>&1
    CHECK_RESULT $? 1 0 "luac did not fail for invalid Lua script"
    grep -q "syntax error" result.txt
    CHECK_RESULT $? 0 0 "luac error message for invalid Lua script is incorrect"
    rm -f invalid.lua

    luac -h > result.txt 2>&1
    CHECK_RESULT $? 0 0 "luac -h command failed"
    grep -q "usage: luac" result.txt
    CHECK_RESULT $? 0 0 "luac -h output is incorrect"

    echo 'print("File 1")' > file1.lua
    echo 'print("File 2")' > file2.lua
    luac -o multiple.luac file1.lua file2.lua
    CHECK_RESULT $? 0 0 "luac failed to compile multiple Lua files"
    CHECK_FILE_EXISTS multiple.luac "Compiled file multiple.luac does not exist"
    rm -f file1.lua file2.lua multiple.luac

    rm -f test.lua result.txt
    LOG_INFO "Finish test!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
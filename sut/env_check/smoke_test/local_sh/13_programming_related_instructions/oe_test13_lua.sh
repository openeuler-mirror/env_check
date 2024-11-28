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

    lua -v > result.txt 2>&1
    CHECK_RESULT $? 0 0 "lua -v command failed"
    grep -q "Lua" result.txt
    CHECK_RESULT $? 0 0 "lua -v output is incorrect"

    lua -e 'print("Hello, Lua!")' > result.txt 2>&1
    CHECK_RESULT $? 0 0 "lua -e command failed"
    grep -q "Hello, Lua!" result.txt
    CHECK_RESULT $? 0 0 "lua -e output is incorrect"

    echo 'print("Lua script executed")' > test.lua
    lua test.lua > result.txt 2>&1
    CHECK_RESULT $? 0 0 "lua script execution failed"
    grep -q "Lua script executed" result.txt
    CHECK_RESULT $? 0 0 "lua script output is incorrect"
    rm -f test.lua

    echo -e "print(1+2)\nos.exit()" | lua > result.txt 2>&1
    CHECK_RESULT $? 0 0 "lua interactive mode failed"
    grep -q "3" result.txt
    CHECK_RESULT $? 0 0 "lua interactive mode output is incorrect"

    LUA_INIT='print("Init script executed")' lua > result.txt 2>&1
    CHECK_RESULT $? 0 0 "lua with LUA_INIT failed"
    grep -q "Init script executed" result.txt
    CHECK_RESULT $? 0 0 "LUA_INIT output is incorrect"

    lua non_existing.lua > result.txt 2>&1
    CHECK_RESULT $? 1 0 "lua did not fail as expected for non-existent file"
    grep -q "cannot open" result.txt
    CHECK_RESULT $? 0 0 "lua error output is incorrect for non-existent file"

    lua -h > result.txt 2>&1
    CHECK_RESULT $? 0 0 "lua -h command failed"
    grep -q "usage: lua" result.txt
    CHECK_RESULT $? 0 0 "lua -h output is incorrect"

    rm -f result.txt

    LOG_INFO "Finish testing lua command!"

}
# 环境清理
function post_test() {
    LOG_INFO "start environment cleanup."
    export LANG=${OLD_LANG}
    LOG_INFO "Finish environment cleanup!"
}

main $@
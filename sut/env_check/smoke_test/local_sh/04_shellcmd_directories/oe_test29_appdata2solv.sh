#!/usr/bin/bash
# Create: 2024-04-22 09:28:32
# Auther: hebinxin
# Description: A shellscript to check  command.

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
    appdata=$OET_PATH/appdata.xml 
    [ -e "$appdata" ] && rm -f $appdata
    LOG_INFO "End to prepare the test environment."
}

# 用例执行
function run_test() {
    LOG_INFO "Start testing..."

    ### appdata2solv is a tool of converting package metadata in AppStream format to solv format  ###

    # 1. test appdata2solv appdata.xml packages.solv
    touch $appdata
    cat << EOF > $appdata
<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop">
  <id>example-app</id>
  <name>Example App</name>
  <summary>A simple example application</summary>
  <description>
    Example App is a simple application that demonstrates how to use AppStream metadata.
  </description>
  <project_license>LGPL-2.1-or-later</project_license>
  <homepage>https://example.com</homepage>
  <screenshots>
    <screenshot type="default">https://example.com/screenshot.png</screenshot>
  </screenshots>
  <categories>
    <category>Development</category>
  </categories>
  <keywords>
    <keyword>example</keyword>
    <keyword>demo</keyword>
  </keywords>
  <dependencies>
    <dependency type="runtime">gtk3</dependency>
    <dependency type="runtime">glibc</dependency>
  </dependencies>
  <metadata_license>CC0-1.0</metadata_license>
</component>
EOF
    pushd /root/gitee/env_check/sut/env_check/smoke_test/local_sh/extended
    appdata2solv -d $appdata
    popd

    CHECK_RESULT $? 0 0 "appdata2solv error"

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    export LANG=${OLD_LANG}
    [ -e "$appdata" ] && rm -f $appdata
    LOG_INFO "End to restore the test environment."
}

main $@
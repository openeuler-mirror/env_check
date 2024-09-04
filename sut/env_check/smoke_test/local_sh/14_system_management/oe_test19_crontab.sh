#!/usr/bin/bash

# Create: 2024-09-03
# Author: panzhe

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

    # 检查是否安装了 'crontab' 命令
    if ! command -v crontab &>/dev/null; then
        crontab_exist=0
        LOG_WARN "'crontab' command is not installed."
        CHECK_RESULT $? 0 0
    else
        crontab_exist=1
        
        ## 运行 'crontab' 命令来添加一个定时服务
        
        # 生成一个带有时间戳的测试文件 : target_file
        timestamp=$(date +%s)
        target_file="$OET_PATH/crontab_test_$timestamp"

        # 定义一个定时服务cron_job：每隔一分钟创建target_file测试文件
        cron_job="* * * * * touch $target_file"  

        # 尝试获取root用户的cron作业列表  
        current_cron=$(sudo -u root crontab -l 2>/dev/null)

        # 检查是否成功获取到了cron作业列表  
        if [ $? -eq 0 ]; then  
            # 如果成功获取到了cron作业列表，则将其与新cron作业一起传递给crontab命令  
            echo "$current_cron  
$cron_job" | sudo -u root crontab -  
        else  
            # 如果没有获取到cron作业列表，则只添加新的cron作业  
            echo "$cron_job" | sudo -u root crontab -  
        fi  

        # 等待80秒
        sleep 80

        # 检查是否存在target_file文件
        if [ -f $target_file ]; then
            LOG_INFO "File exist : $target_file ..."
        else
            LOG_ERROR "File not exist : $target_file ..."
            exit 1
        fi

        ## 使用 'crontab -V' 命令查看版本信息
        crontab -V
        CHECK_RESULT $? 0 0
    fi

    LOG_INFO "Finish test!"
}

# 环境清理
function post_test() {
    LOG_INFO "Start to restore the test environment."
    if [ $crontab_exist -eq 0 ]; then
        LOG_INFO "'crontab' command is not installed."
    else
        LOG_INFO "'crontab' command is installed."
        # 获取当前的cron作业列表  
        current_cron=$(sudo -u root crontab -l 2>/dev/null) 
        # 检查是否成功获取到了cron作业列表  
        if [ $? -ne 0 ]; then  
            LOG_ERROR "Failed to retrieve crontab for root user."  
            exit 1
        fi  
        modified_cron=$(echo "$current_cron" | grep -vFx "$cron_job")  
        # 检查是否删除了作业  
        if [ "$(echo -n "$modified_cron" | wc -c)" -eq "$(echo -n "$current_cron" | wc -c)" ]; then  
            LOG_ERROR "Cron job not found or unable to delete."  
            exit 1
        else
            echo "$modified_cron" | sudo -u root crontab -
            LOG_INFO "Delete test cron job"
        fi 
        rm -f $target_file
    fi
    export LANG=${OLD_LANG}
    LOG_INFO "End to restore the test environment."
}

main $@

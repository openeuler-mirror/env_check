#!/usr/bin/bash

function LOG_INFO() {
    message=$1
    echo -e "\033[32m [INFO] $message \t$1\t$2\033[0m"
}

function LOG_ERROR() {
    message=$1
    echo -e "\033[31m [ERROR] $message \t$1\t$2\033[0m"
}

function LOG_WARN() {
    message=$1
    echo -e "\033[33m [WARN] $message \t$1\t$2\033[0m"
}

function LOG_DEBUG() {
    message=$1
    echo -e "\033[36m [DEBUG] $message \t$1\t$2\033[0m"
}


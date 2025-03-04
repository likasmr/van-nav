#!/bin/bash

WORK_DIR="/usr/home/$(whoami)/nav"
NAV_PATH="$WORK_DIR/van-nav"
LOG_FILE="$WORK_DIR/restart_log.txt"
NAV_PORT=端口号  



if ! pgrep -f "$NAV_PATH" > /dev/null
then
    cd "$WORK_DIR"
    nohup ./van-nav -port $NAV_PORT > /dev/null 2>&1 &
    
    BEIJING_TIME=$(TZ=Asia/Shanghai date +"%Y-%m-%d %H:%M:%S")
    
    echo "van-nav 导航服务于 ${BEIJING_TIME} 重启" >> "$LOG_FILE"
fi

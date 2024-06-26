#!/bin/bash

echo "Starting publish process..."

# 检查并杀掉已有的 wiki.jar 进程
process_id=$(ps -ef | grep song-wiki.jar | grep -v grep | awk '{print $2}')
if [ $process_id ]; then
    echo "Killing existing song-wiki.jar process with PID: $process_id"
    sudo kill -9 $process_id
fi

# 加载环境变量（如果需要）
source /etc/profile

# 启动新的 song-wiki.jar 进程
echo "Starting new song-wiki.jar process..."
nohup java -jar -Dspring.profiles.active=prod /home/ubuntu/song-wiki.jar > /dev/null 2>&1 &

echo "End publish process"

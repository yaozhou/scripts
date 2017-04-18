#!/bin/sh

#/home/yao/develop/todolist2/run.sh
cd /home/yao/web_static && nohup http-server -p 8000 > /tmp/t1 &
cd /home/yao/blog && nohup http-server -p 8001 > /tmp/t2 &


/home/yao/develop/scripts/ss_local.sh
sudo nohup node /home/yao/develop/scripts/proxy/proxy.js > /tmp/proxy.out &
nohup node /home/yao/develop/logic-test/main.js &
nohup node /home/yao/develop/ear-travel/main.js &
/home/yao/develop/NodeBB/nodebb start





#!/bin/sh

#sh -x ws.sh

/home/yao/develop/scripts/ss_local.sh

cd /home/yao/develop/scripts/proxy
sudo nohup node /home/yao/develop/scripts/proxy/proxy.js > /tmp/proxy.out &

cd /home/yao/develop/logic-test
nohup node /home/yao/develop/logic-test/main.js &

cd /home/yao/develop/ear-travel
nohup node /home/yao/develop/ear-travel/main.js &
#/home/yao/develop/NodeBB/nodebb start

#cd /home/yao/develop/ele/heatmap/out
#nohup http-server -p 8889 &

nohup superset runserver &

#sudo service mariadb start

nohup redis-server &

sudo mount -t nfs -o vers=4.0  0e42648e07-esb49.cn-hangzhou.nas.aliyuncs.com:/ /nfs

/home/yao/software/atlassian-jira-6.3.6-standalone/bin/start-jira.sh

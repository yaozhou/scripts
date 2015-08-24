#!/bin/sh

day=`date +%y%m%d`
back_dir_server="/home/na/develop/wiki"
back_file_server="${back_dir_server}/${day}.sql.gz"
back_dir_client="/home/eric-zhou/Dropbox/private/document/wiki_backup/${day}.sql.gz"

cmd="mysqldump -h localhost -u root -pna my_wiki | gzip > ${back_file_server}"

echo "正在生成备份..."
ssh na@chun "$cmd"
echo "正在拉取备份文件..."
scp na@chun:${back_file_server} ${back_dir_client}

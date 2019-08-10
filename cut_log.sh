#!/bin/bash
logs_path="/data/log/"
pid_path="/var/run/nginx.pid"
nfs_path="/mnt/web_log/"
nfs_log_path="/mnt/web_log/$HOSTNAME/"
if [ -d $nfs_path ];then
mkdir -p $nfs_log_path
cp ${logs_path}access.log ${nfs_log_path}access.log.`date -d "yesterday" +"%Y%m%d"`
cp ${logs_path}error.log ${nfs_log_path}error.log.`date -d "yesterday" +"%Y%m%d"`
rm -f ${logs_path}access.log
rm -f ${logs_path}error.log
#touch ${logs_path}access.log
#touch ${logs_path}error.log
fi
[ -f $pid_path ]&& kill -USR1 `cat ${pid_path}`


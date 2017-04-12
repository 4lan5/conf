#!/bin/bash
# Filename:kill_mysql_lock.sh
# find mysql locked id and kill, maybe you need run it by crontab.
# chmod 500 kill_mysql_lock.sh will be better.

export MYSQL_PWD=pwd

for id in `mysqladmin  processlist | grep -i lock | awk '{print $2}'`
do
mysqladmin  kill ${id}
done


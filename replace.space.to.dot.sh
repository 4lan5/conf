#!/bin/bash
# Author:alans
# mail:root@4lan5.me
# Created : 2020-03-02 21:37:19
# Last Modified: 2020-03-02 21:40:12
# File Name: replace.space.to.dot.sh
# Description:replace file or dir name that contain space to dot

#find . -type f -name "* *" -print |
find . -type d -name "* *" -print |
while read name; do
na=$(echo $name | tr ' ' '.')



if [[ $name != $na ]]; then
mv "$name" $na
fi
done

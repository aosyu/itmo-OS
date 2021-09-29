#!/bin/bash

touch info.log

while read line
do
if [[ $line =~ ^.*[[:space:]]+INFO[[:space:]]+.* ]]
then
echo $line >> "$PWD/info.log"
fi
done < /var/log/anaconda/syslog


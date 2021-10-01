#!/bin/bash

#bash pr.sh &
#bash pr.sh &
#bash pr.sh &

#sleep 1m

for pid in $(ps -Ao pid --no-header)
do
	file=/proc/$pid/status
	if [[ -f $file ]]
	then
		echo `grep VmSize /proc/$pid/status | awk '{print $2}'`
	fi
done | sort -n | tail -3

top -o VIRT | head -11 | tail -4

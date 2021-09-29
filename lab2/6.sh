#!/bin/bash


for pid in $(ps -Ao pid --no-header)
do
	file=/proc/$pid/status
	if [[ -f $file ]]
	then
		echo `grep VmSize /proc/$pid/status | awk '{print $2}'`
	fi
done | sort -n | tail -1

top -o VIRT | head -8 | tail -2

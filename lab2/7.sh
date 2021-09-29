#!/bin/bash

for pid in $(ps -Ao pid --no-header)
do
	file=/proc/$pid/io
	if [[ -f $file ]]
	then
		echo $pid `grep read_bytes $file | awk '{print $2}'`
	fi
done > 7_before

#sleep 1m

while read string
do
	pid=$(echo $string | awk '{print $1}')
	file=/proc/$pid/io
	if [[ -f $file ]]
	then
		before=$(echo $string | awk '{print $2}')
		after=$(grep read_bytes $file | awk '{print $2}')
		echo $pid ":" $(expr $after - $before)
	fi
done < 7_before | sort -nk 2 | head -3

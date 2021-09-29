#!/bin/bash


for pid in `ps -Ao pid --no-header`
do
	file1=$(cat /proc/$pid/status 2>/dev/null) || continue
	PPid=$(echo "$file1" | grep PPid | awk '{print $2}')
	file2=$(cat /proc/$pid/sched 2>/dev/null) || continue
	sum_exec_runtime=$(echo "$file2" | grep se.sum_exec_runtime | awk '{print $3}')
	nr_switches=$(echo "$file2" | grep nr_switches | awk '{print $3}')

#	file=/proc/$pid
#	if [[ -e $file ]]
#	then
#	PPid=`grep PPid $file/status 2>/dev/null | awk '{print $2}'` || continue
#	sum_exec_runtime=`grep se.sum_exec_runtime $file/sched 2>/dev/null | awk '{print $3}'` || continue
#	nr_switches=`grep nr_switches $file/sched 2>/dev/null | awk '{print $3}'` || continue

	ART=$(echo "$sum_exec_runtime/$nr_switches" | bc -l)
	echo "ProcessID=$pid : Parent_ProcessID=$PPid : Average_Running_Time=$ART"
#	fi
done | sort -t "=" -n -k 3 > ans4


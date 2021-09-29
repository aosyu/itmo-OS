#!/bin/bash


for pid in `ps -Ao pid --no-header`
do
	file=/proc/$pid
	if [[ -e $file ]]
	then
		PPid=`grep PPid $file/status 2>/dev/null | awk '{print $2}'`
		sum_exec_runtime=`grep se.sum_exec_runtime $file/sched | awk '{print $3}'`
		nr_switches=`grep nr_switches $file/sched | awk '{print $3}'`
		ART=$(echo "$sum_exec_runtime/$nr_switches" | bc -l)

		echo "ProcessID=$pid : Parent_ProcessID=$PPid : Average_Running_Time=$ART"
	fi
done | sort -t "=" -n -k 3 > ans4


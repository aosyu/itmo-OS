#!/bin/bash

> 1_process_params
> 2_process_params
> system_memory_params2
> 5_first_processes2

PID1=`cat pid`
PID2=`cat pid2`
while ps -p $PID2 > /dev/null ; do
	echo "ku!"
	top -b -n 1 > top2.txt
	cat top2.txt | grep $PID1 >> 1_process_params
	cat top2.txt | grep $PID2 >> 2_process_params
	cat top2.txt | tac | tail -5 | head -2 >> system_memory_params
	cat top2.txt | tac | tail -12 | head -5 >> 5_first_processes
#	top -p $PID1 | head -8 | tail -1 >> 1_process_params
#	top -p $PID2 | head -8 | tail -1 >> 2_process_params
#	top -p $PID1 | head -5 | tail -2 >> system_memory_params2
#	top | head -12 | tail -5 >> 5_first_processes2
done

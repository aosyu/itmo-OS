#!/bin/bash

> current_process_params
> system_memory_params
> 5_first_processes

PID=`cat pid`

while ps -p $PID > /dev/null ; do
	top -b -n 1 > top.txt
	cat top.txt | grep $PID >> current_process_params
	#top -p $PID -d 1 | head -8 | tail -1 >> current_process_params
	#top -p $PID -d 1 | head -5 | tail -2 >> system_memory_params
	#top -d 1 | head -12 | tail -5 >> 5_first_processes

	cat top.txt | grep MiB >> system_memory_params
	cat top.txt | head -12 | tail -5 >> 5_first_processes
	echo "ho"
	sleep 1
done


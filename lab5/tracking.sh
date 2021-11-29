#!/bin/bash

> current_process_params
> system_memory_params
> 5_first_processes

PID=`cat pid`

while ps -p $PID > /dev/null ; do
	top -b -n 1 > top.txt
	cat top.txt | grep $PID >> current_process_params
	cat top.txt | grep MiB >> system_memory_params
	cat top.txt | head -12 | tail -5 >> 5_first_processes
	sleep 1
done


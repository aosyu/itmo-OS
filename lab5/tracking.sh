#!/bin/bash

> current_process_params
> system_memory_params
> 5_first_processes

#PID=`cat pid`
PID=1
echo "" >> system_memory_params
top -p $PID | head -5 | tail -2 >> system_memory_params
top | head -12 | tail -5

while ps -p $PID > /dev/null ; do
	top -p $PID | head -8 | tail -1 >> current_process_params
	top -p $PID | head -5 | tail -2 >> system_memory_params
	top | head -12 | tail -5 >> 5_first_processes
	sleep 5
done


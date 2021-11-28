#!/bin/bash

> 1_current_process_params
> 2_current_process_params
> system_memory_params2
> 5_first_processes2

PID1=`cat pid`
PID2=`cat pid2`
while ps -p $PID1 > /dev/null ; do
	top -p $PID1 | head -8 | tail -1 >> 1_process_params
	top -p $PID2 | head -8 | tail -1 >> 2_process_params
	top -p $PID1 | head -5 | tail -2 >> system_memory_params2
	top | head -12 | tail -5 >> 5_first_processes2
done

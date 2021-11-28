#!/bin/bash

PID=$$
echo $PID > pid

> report.log
counter=0
arr=()
counter+=1
while true; do
	arr+=(1 2 3 4 5 6 7 8 9 10)
	if [[ $(($counter % 100000)) -eq 0 ]] ; then
		echo ${#arr[*]} >> report.log
	fi
	let counter+=1
done

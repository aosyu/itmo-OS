#!/bin/bash

PID=`cat pid`

while ps -p $PID > /dev/null ; do
	curr=`top -o VIRT | head -8 | tail -1 | awk '{print $2}'`
	if [[ $curr -eq $PID ]] ; then
		kill -USR1 $(cat .pid)
		break
	#	kill $PID
	fi
done

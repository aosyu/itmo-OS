#!/bin/bash

PID=`cat pid`

echo $$ > .pid
usr1()
{
	op="DONE"
}
trap 'usr1' USR1

while true; do
case $op in
	DONE)

for pid in $(ps -Ao pid --no-header)
do
	file=/proc/$pid/status
	if [[ -f $file ]]
	then
		echo "`grep VmSize /proc/$pid/status | awk '{print $2}'` $pid"
	fi
done | sort -n | tail -1 | awk '{print $2}' > pid1

pid2=`top -bn 1 -o VIRT | head -8 | tail -1 | awk '{print $1}'`

kill $PID

if [[ $PID -eq `cat pid1` ]] ; then
	if [[ $PID -eq $pid2 ]] ; then
		echo 'Victory!'
	fi
fi

exit
esac
done

#!/bin/bash

echo $$ > .pid
A=1
op=""
usr1()
{
	op="ADD"
}
usr2()
{
	op="MULTIPLY"
}
term()
{
	op="TERMINATE"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true; do
	case $op in
		ADD)
			let A=$A+2
			echo $A
			;;
		MULTIPLY)
			let A=$A*2
			echo $A
			;;
		TERMINATE)
			echo 'exit'
			exit
			;;
	esac
	sleep 1
done

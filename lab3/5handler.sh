#!/bin/bash

number="^[0-9]+$"
op='ADD'
x=1

(tail -f pipe) |
while true; do
	read LINE
	if [[ $LINE == 'QUIT' ]]; then
		echo 'exit'
		killall tail
		exit
	elif [[ $LINE == '+' ]]; then
		op='ADD'
	elif [[ $LINE == '*' ]]; then
		op='MULTIPLY'
	elif [[ $LINE =~ $number ]]; then
		case $op in
			ADD)
				x=$(bc <<< "$x+$LINE")
				echo $x
				;;
			*)
				x=$(bc <<< "$x*$LINE")
				echo $x
				;;
		esac
	else
		echo 'bad input'
		killall tail
		exit
	fi
done

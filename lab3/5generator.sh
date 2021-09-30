#!/bin/bash

number="^[0-9]+$"
> pipe
while true; do
	read LINE
	echo "$LINE" >> pipe
	if [[ $LINE == "QUIT" || !($LINE == '+' || $LINE == '*' || $LINE =~ $number) ]]; then
		break
	fi
done

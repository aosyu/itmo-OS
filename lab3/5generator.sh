#!/bin/bash

> pipe
while true; do
	read LINE
	echo "$LINE" >> pipe
	if [[ $LINE == "QUIT" || $LINE ==  ]]; then
		break
	fi
done

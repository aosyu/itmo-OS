#!/bin/bash

x=1

PID=$$
echo $PID > p1pid

while true
do
	let x=$x*2
done

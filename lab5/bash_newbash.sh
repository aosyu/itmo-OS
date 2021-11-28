#!/bin/bash

N=$1
K=30

while (( $K != 0 )) ; do
	bash newmem.bash $N &
	let K-=1
	sleep 1
done

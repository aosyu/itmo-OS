#!/bin/bash

date_time=$(date '+%d.%m.%y_%H:%M:%s')

rm -r /home/test

mkdir "/home/test" && {
	echo "catalog test was created successfully" >> ~/report
	touch /home/test/$date_time
}

ping -c 1 www.net_nikogo.ru || echo "$date_time something went really wrong" >> ~/report

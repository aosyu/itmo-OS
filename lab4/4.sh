#!/bin/bash

cd /home/user/

if ! [[ -d restore ]] ; then
	mkdir restore
fi

last=`ls | grep "^Backup-" | sort -n | tail -1`

for file in `ls $last` ; do
	[[ `echo $file | rev` =~ ^([1-9]0|[0-9][1-2]|[0-1]3).([1-9]0|[0-2]1).[0-9]{4} ]] ||
	cp /home/user/$last/$file /home/user/restore
done

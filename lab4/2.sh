#!/bin/bash

filename=$1

#awk -F "=" '{print $1}' /home/trash.log | awk -v name="$1" -F "/" '($NF == name)'

while read line; do
	fullname=`echo $line | awk -F '=' '{print $1}'`
	current=`echo $line | awk -F '=' '{print $1}' | awk -F '/' '{print $NF}'`

	if [[ $current == $filename ]] ; then
		echo "Restore $fullname? (y/n):"
		read ans <&1
		if [[ $ans == 'y' ]] ; then
			path=`echo $fullname | rev | cut -d'/' -f 2- | rev`
			if ! [[ -d $path ]] ; then
				echo "This catalog is not found. The file will be restored to /home"
				fullname=/home/$filename
			fi
			ln 
		fi
	fi


done < /home/trash.log

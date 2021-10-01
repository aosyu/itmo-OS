#!/bin/bash

filename=$1

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
				path=/home
			fi
			fullname=$path/$filename

			while [[ -f $fullname ]] ; do
				echo "This filename already exists. Wanna rename your file? (y/n):" ;
				read ans <&1
				if [[ $ans == 'y' ]] ; then
					echo "New filename:"
					read ans <&1
					fullname=$path/$ans
				else
					break
				fi
			done

			link=`echo $line | awk -F '=' '{print $2}'`
			ln /home/.trash/$link $fullname &&
			rm /home/.trash/$link
		fi
	fi
done < /home/trash.log

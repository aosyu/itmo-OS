#!/bin/bash

file=$1
dir=/home/.trash

if ! [[ -d $dir ]] ; then
	mkdir $dir
fi

if ! [[ -f $file ]] ; then
	echo "No such file"
	exit 1
fi

link=`ls $dir | wc -l`
let link=$number+1

ln $file "$dir/$link" &&
rm $file &&
echo `realpath "$file"` $link >> /home/trash.log


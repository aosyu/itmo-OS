#!/bin/bash

cd /home/user/

last=`ls | grep "^Backup-" | sort -n | tail -1`
date_last=`ls | grep "^Backup-" | sort -n | tail -1 | awk -F '-' '{print $2"-"$3"-"$4}'`
date_last_s=`date -d $date_last +%s`
date_now=`date +'%Y-%m-%d'`
date_now_s=`date -d $date_now +%s`
diff=$((($date_now_s-$date_last_s)/86400))

# TODO :: if there is no Backup directory

if (( $diff > 7 )) ; then
	newdir=Backup-$date_now
	mkdir $newdir
	cp -R /home/user/source/. $newdir/
	echo "New backup-catalog" $newdir "created:" $date_now >> /home/user/backup-report
	ls -R /home/user/source >> /home/user/backup-report

else
	path=/home/user/$last
	source_path=/home/user/source
	for file in $(ls $source_path) ; do
		if [[ -f $path/$file ]] ; then
			if [[ $(stat $path/$file -c%s) -ne $(stat $source_path/$file -c%s) ]] ; then
				echo $file
			fi
		else
			cp $source_path/$file $path
		fi
	done

fi

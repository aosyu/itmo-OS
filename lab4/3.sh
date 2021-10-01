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
	added_files=""
	modified_files=""
	for file in $(ls $source_path) ; do
		if [[ -f $path/$file ]] ; then
			if [[ $(stat $path/$file -c%s) -ne $(stat $source_path/$file -c%s) ]] ; then
				mv $path/$file $path/$file.$date_now
				cp $source_path/$file $path
				modified_files+="$file $file.$date_now, "
			fi
		else
			cp $source_path/$file $path
			added_files+="$file, "
		fi
	done
	report=/home/user/backup-report
		echo $last "catalog modified" $date_now >> $report
		echo "Added files: $added_files" >> $report
		echo "Modified files: $modified_files" >> $report
fi

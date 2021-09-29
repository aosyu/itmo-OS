#!/bin/bash

ppid=0
count=0
sum=0
 > ans5
while read string
do
	IFS='= '
	read -a arr <<< $string

	if [[ ${arr[4]} -eq $ppid ]]
	then
		let "count+=1"
		sum=$(echo "$sum+${arr[7]}" | bc -l)
		echo "$string" >> ans5
	else
		m=$(echo "$sum/$count" | bc -l)
		echo "Average_Running_Children_of_ParentID=$ppid is $m" >> ans5
		echo "$string" >> ans5
		sum=${arr[7]}
		count=1
		ppid=${arr[4]}
	fi
done < ans4
echo "Average_Running_Children_of_ParentID=$ppid is $(echo "$sum/$count" | bc -l)" >> ans5

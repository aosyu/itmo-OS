#!/bin/bash

touch full.log
#echo "" > full.log

sed -e 's/(\*\*)/Warning:/; s/(II)/Information:/' /var/log/anaconda/X.log >> temp.txt

grep "Warning:" temp.txt > full.log
grep "Information" temp.txt >> full.log

cat full.log

rm temp.txt

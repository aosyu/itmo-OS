#!bin/bash

touch emails.lst
#echo "" > emails.lst

grep -E -r -h -o --text '[[:alnum:]_-]+@[[:alnum:]]+\.[[:alnum:]]+'   /etc | sort | uniq >> emails.lst

cat emails.lst

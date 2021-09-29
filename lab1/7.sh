#!bin/bash

touch emails.lst
echo "" > emails.lst

grep -E -r -i -o -h '[[:alnum:]_-]+@[[:alnum:]]+\.[[:alnum:]]+' --binary-files=text /etc | sort | uniq >> emails.lst

cat emails.lst

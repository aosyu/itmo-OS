#!bin/bash

touch emails.lst

grep -E -r -h -o --text '[[:alnum:]_-]+@[[:alnum:]]+\.[[:alnum:]]+'   /etc | sort | uniq >> emails.lst

cat emails.lst

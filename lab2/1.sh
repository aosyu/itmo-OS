#!/bin/bash

file=$(ps -Ao user,pid,cmd)
echo "$file" | grep -c $USER > ans1
echo "$file" | awk -v user="$USER" '$1 ~ user {print($2, ":", $3)}' >> ans1

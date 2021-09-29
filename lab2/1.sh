#!/bin/bash

ps -A u | grep -c $USER > ans1
ps -A -o user,pid,cmd | awk -v user="$USER" '$1 ~ user {print($2, ":", $3)}' >> ans1



# | grep root | awk ' {print($2, ":", $3)} ' >> ans1

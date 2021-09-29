#!/bin/bash

ps -A u | grep -c root > ans1
ps -A -o user,pid,cmd | grep root | awk ' {print($2, ":", $3)} ' >> ans1

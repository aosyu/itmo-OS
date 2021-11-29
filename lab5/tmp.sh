#!/bin/bash

top -b -n 1 >> tmp
#cat $tmp | grep root
cat tmp | grep 2386

#cat $tmp | head -1 >> tmp1
#top -p 1 | grep root | head -1 >> current_process_params

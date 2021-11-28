#!/bin/bash

> tmp
tmp=0
let tmp+=34
echo $tmp
let tmp+=3
echo $tmp
arr=(1 2 3 4)
echo ${#arr[*]} >> tmp

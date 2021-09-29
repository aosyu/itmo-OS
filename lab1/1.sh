#!/bin/bash

Max=$1

if [[ $1 -gt $2 ]]
then Max=$1
else Max=$2
fi

if [[ $3 -gt $Max ]]
then Max=$3
fi

echo $Max


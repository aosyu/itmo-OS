#!/bin/bash

Max=$1

if (( $(bc <<<"$1 > $2") ))
then Max=$1
else Max=$2
fi

if (( $(bc <<<"$3 > $Max") ))
then Max=$3
fi

echo $Max


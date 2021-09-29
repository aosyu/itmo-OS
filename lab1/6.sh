#!/bin/bash

touch full.log
echo "" > full.log

replaced=$(sed -e 's/(\*\*)/Warning:/; s/(II)/Information:/' /var/log/anaconda/X.log)

echo "$replaced" | grep "Warning:" >> full.log
echo "$replaced" | grep "Information:" >> full.log

cat full.log

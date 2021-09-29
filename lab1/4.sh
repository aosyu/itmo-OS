#!/bin/bash

if [[ $PWD != $HOME  ]]
then
echo "File must be run from $HOME directory"
exit 1
else
echo "$HOME"
exit 0
fi

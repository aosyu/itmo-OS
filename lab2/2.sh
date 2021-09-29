#!/bin/bash

ps -A -o pid,cmd | awk '$2 ~ /sbin\// {print $1}' > ans2


# | grep /sbin/ | awk '{print $1}' > ans2

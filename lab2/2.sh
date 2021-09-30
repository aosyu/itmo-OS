#!/bin/bash

ps -A -o pid,cmd | awk '$2 ~ /^\/sbin\// {print $0}' > ans2

#!/bin/bash

ps --pid $$ --ppid $$ -N --no-headers | sort -r -k 3 | head -1 | awk '{print $1}'


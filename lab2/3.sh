#!/bin/bash

ps -A -o start,pid | sort -r -k 1 | sed -n '2p' | awk '{print $2}'

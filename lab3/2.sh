#!/bin/bash

at -f 1.sh now + 2 minutes
tail -n 0 -f ~/report


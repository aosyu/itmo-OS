#!/bin/bash

cpulimit -l 10 bash p1.sh &
bash p2.sh &
bash p3.sh &

kill $(cat p3pid)







#sleep 5s &&
#echo `$(kill $(cat p1pid) 2>/dev/null && kill $(cat p2pid) 2>/dev/null)` | at now+1min

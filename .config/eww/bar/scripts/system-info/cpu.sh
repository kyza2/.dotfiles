#!/bin/bash
cpuusage=$(top -b -n 1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo $(printf "%.0f\n" $cpuusage)

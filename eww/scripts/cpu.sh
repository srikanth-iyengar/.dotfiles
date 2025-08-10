#!/bin/bash
cpuUsage=$(top -bn1 | awk '/Cpu/ { print $2 }') 
echo $cpuUsage


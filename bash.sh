#!/bin/bash

# DevOps System Health Check Script
# Author: DevOps Practitioner
# Description: Checks CPU, Memory, Disk, and Running Services

echo "=============================="
echo "   SYSTEM HEALTH CHECK REPORT "
echo "=============================="
echo "Hostname : $(hostname)"
echo "Date     : $(date)"
echo "Uptime   : $(uptime -p)"
echo ""

# CPU Usage
echo "---- CPU Usage ----"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Used: " 100-$8 "%"}'
echo ""

# Memory Usage
echo "---- Memory Usage ----"
free -h | awk 'NR==2{print "Used: "$3" / Total: "$2}'
echo ""

# Disk Usage
echo "---- Disk Usage ----"
df -h / | awk 'NR==2{print "Used: "$3" / Total: "$2" ("$5" used)"}'
echo ""

# Load Average
echo "---- Load Average ----"
uptime | awk -F'load average:' '{ print $2 }'
echo ""

# Check Critical Services
echo "---- Service Status ----"
services=("ssh" "cron" "docker")

for service in "${services[@]}"
do
    if systemctl is-active --quiet $service; then
        echo "$service : RUNNING"
    else
        echo "$service : NOT RUNNING"
    fi
done

echo ""
echo "System health check completed."


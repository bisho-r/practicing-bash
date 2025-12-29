#!/bin/bash

# DevOps Log Cleanup Script
# Description: Cleans old log files to free disk space
# Usage: Run as root or with sudo

LOG_DIR="/var/log"
DAYS_OLD=7

echo "=============================="
echo "   LOG CLEANUP REPORT"
echo "=============================="
echo "Date: $(date)"
echo ""

echo "Disk usage before cleanup:"
df -h /
echo ""

echo "Finding and deleting log files older than $DAYS_OLD days..."

find $LOG_DIR -type f -name "*.log" -mtime +$DAYS_OLD -exec rm -f {} \;

echo ""
echo "Cleanup completed."

echo ""
echo "Disk usage after cleanup:"
df -h /
echo ""

echo "Log cleanup task finished successfully."


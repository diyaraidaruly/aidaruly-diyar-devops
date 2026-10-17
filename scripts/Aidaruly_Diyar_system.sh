#!/bin/bash

echo "=============================="
echo "Student Information"
echo "=============================="
echo ""
echo "Name: Diyar"
echo "Surname: Aidaruly"
echo "Group: IT2-2307"
echo "Student ID: 37452"
echo ""
echo "=============================="
echo "System Information"
echo "=============================="
echo ""
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -a)"
echo ""
echo "Disk Usage:"
df -h /
echo ""
echo "Memory Usage:"
free -h
echo ""

if [ -f "$HOME/devops/aidaruly_diyar/Aidaruly_Diyar_info.txt" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi

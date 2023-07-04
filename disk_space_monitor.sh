#!/bin/bash

###########################################################################################################
# Author: Birbal S Naik                                                                                   #
# Date  : june 1st 2023                                                                                   #
#                                                                                                         #
# This script checks the disk space, and if it exceeds 90% usage,it sends an alert.                       #
###########################################################################################################


alert=90
   df -H | awk '{print $5 " " $1}' | while read output;
do
   #echo "Disk Detail: $output"
   usage=$(echo $output | awk '{print $1}' | cut -d'%' -f1)
   file_sys=$(echo $output | awk '{print $2}')
   #echo $usage
if [ $usage > $alert ]
   then
   echo "CRITICAL for $file_sys"
fi
   done

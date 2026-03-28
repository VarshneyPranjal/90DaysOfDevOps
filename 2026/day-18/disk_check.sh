#!/bin/bash

check_disk(){
    usage=$(df -h | awk 'NR==2 { print $3 }')
    echo "disk usage of '/' is: $usage"
}
check_memory(){
    unused=$(top -l 1 | grep PhysMem | awk '{ print $8 }')
    echo "free physical memory: $unused"
}
check_disk
check_memory
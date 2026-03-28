#!/bin/bash 

# check if given input file exists or not.

read -p "Enter the filename: " fileName

if [ -f $fileName ]; then 
    echo "File exists"
else 
    echo "File doesn't exist"
fi
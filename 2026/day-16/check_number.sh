#!/bin/bash

# Check Number entered by user is Positive, Negative or zero. 

read -p "Enter Number :" Number         #taking input from user
if [ $Number -gt 0 ];then
    echo "Number is Positive"
elif [ $Number -lt 0 ]; then
    echo "Number is Negative"
else
    echo "Number is Zero"
fi
#!/bin/bash

# Takes a number from user, countdown to 0 using a WHILE loop, and print "Done!" at the end.

read -p "enter a number: " Number

while [ $Number -ge 0 ] 
do 
    echo $Number
    ((Number--))
done
echo "Done!"
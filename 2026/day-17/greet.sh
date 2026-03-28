#!/bin/bash

# Accepts a name as `$1`, Prints `Hello, <name>!`, If no argument is passed, prints "Usage: ./greet.sh <name>"

if [ $# -eq 0 ]; then 
    echo "Please pass your name as an argument"
    echo "Usage: ./greet.sh <name>"
else
    echo "Hello, $1!"
fi
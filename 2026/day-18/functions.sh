#!/bin/bash
greet(){
    if [[ -z "$1" ]]; then      #TRUE if $1 is empty or not provided.
        echo "Please pass your name as an argument."
        echo "Usage: ./functions.sh <your-name> <number1> <number2>" 
        return
    else 
        echo "Hello, $1!"
    fi
}
add(){
    if [[ -z "$1" || -z "$2" ]]; then   #TRUE when either $1 or $2 is empty or not provided.
        echo "Please pass two numbers for sum"
        echo "Usage: ./functions.sh <your-name> <number1> <number2>"
        return 
    else
        echo "The sum of $1 and $2 is: $(( $1 + $2 ))"
    fi
}

greet "$1"   #take input from user
add "$2" "$3"  #take input from user

# greet "rahul"  #hardcoded passed argument
# add 1 3        #hardcoded passed argument
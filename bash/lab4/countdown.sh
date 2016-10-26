#!/bin/bash

# TITTLE countdown.sh

# This script requests a user-specified number of seconds and prints them 
# out an update each second showing how many seconds are left, and catches
# the interrupt and the quit signals. If it gets the interrupt signal
# (like from a ^C), have it reset the timer to the initial number of seconds
# and print out a message saying it is doing that. It should simply exit with
# a message if it receives the quit signal (like from a ^\). 

### VARABLES

declare -i count_down=$1
orginal_count=$count_down



### MAIN

trap ' count_down=$orginal_count && echo "" ' 2

if [ $count_down -gt 0 ]; then

    echo ""
    
else

    read -p "provide number of seconds to countdown from " count_down
    
fi

while [ $count_down -gt 0 ]; do

    echo "The current countdown number is: $count_down"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    
    count_down=$(($count_down-1))
    
    sleep 0.75
done


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

orginal_count=0


### Functions
function usage { # Displays helpful information to user
    echo ""
    echo "Help Doc for: $0  "
    echo "-------------------------------------------------------"
    echo "| -h|--help  : Opens this help file.                  |"
    echo "| -c|--count : Takes number of seconds to count down. |"
    echo "-------------------------------------------------------"
}

function error-message { # Error Processing 
    echo "$@" >&2
}


### COMMAND LINE PROCESSING 

while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) # Show help doc
        usage
        exit 0
        ;;
    -c | --count ) # Gets number from user for countdown
        count_down=$2
        orginal_count=$count_down
        shift
        ;;
    * ) # Handles unknowen requests and provised help doc
        usage && error-message 
        exit 1
        ;;
    esac
    shift
done




### MAIN



if [ $orginal_count -eq 0 ]; then # if statment to check for user input

    read -p "provide number of seconds to countdown from " count_down # Requesting userinput for time to count down for
    echo ""
    orginal_count=$count_down
    
fi

### KEYBOARD TRAPS

trap 'echo "" && count_down=$orginal_count' 2 # This resets the countdown
trap 'echo "You quit the program." && exit 0' 3 # This closes the program with a message

while [ $count_down -gt 0 ]; do # Loop creating the countdown

    echo "The current countdown number is: $count_down"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    
    count_down=$(($count_down-1))
    
    sleep 1 # Number of seconds between responces

done  
    








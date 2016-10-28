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

red=`tput setaf 1`     # 
green=`tput setaf 2`   #
yellow=`tput setaf 3`  #
blue=`tput setaf 4`    #
magenta=`tput setaf 5` # These set colurs for text
cyan=`tput setaf 6`    #
white=`tput setaf 7`   #
                       #
reset=`tput sgr0`      # This resets the colour of the text 


### Functions
function usage { # Displays helpful information to user
    echo ""
    echo "Help Doc for: ${red}$0${reset}  "
    echo "-------------------------------------------------------"
    echo "| -h|--help  : Opens this help file.                  |"
    echo "| -c|--count : Takes number of seconds to count down. |"
    echo "-------------------------------------------------------"
}

function error-message { # Error Processing 
    echo "$@" >&2
}

function cleanup_and_exit { # restore cursor & keyboard echo
	tput cnorm  
	stty echo 
	exit $1
}

### KEYBOARD TRAPS

trap 'echo "" && count_down=$orginal_count && clear' 2 # This resets the countdown
trap 'clear && echo "You quit the program." && cleanup_and_exit && exit 0' 3 # This closes the program with a message


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

clear
tput civis # hide cursor
stty -echo # disable keyboard echo

while [ $count_down -gt 0 ]; do # Loop creating the countdown

    echo "${white}The current countdown number is:${green} $count_down${reset}"
    echo "${blue}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~${reset}"
    
    count_down=$(($count_down-1))
    
    sleep 1 # Number of seconds between responces

done  

cleanup_and_exit 








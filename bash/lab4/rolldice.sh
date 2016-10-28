#!/bin/bash
# this script prompts the user for a count of dice and then rolls them

### VARIABLES
declare -i number_of_dice=0   # Number of dice to role.
declare -i number_of_sides=0  # Number of sides per die, must be between 4 and 20.
declare -i rolled=0           # Tallies tottal role 

red=`tput setaf 1`     # 
green=`tput setaf 2`   #
yellow=`tput setaf 3`  #
blue=`tput setaf 4`    #
magenta=`tput setaf 5` # These set colurs for text
cyan=`tput setaf 6`    #
white=`tput setaf 7`   #
                       #
reset=`tput sgr0`      # This resets the colour of the text 

### FUNCTIONS
function usage {


    echo " Help Doc for: ${red}$0${reset} "
    echo "--------------------------------------------------------------------------------"
    echo "|-h|--help   : access this file                                                |"
    echo "|-n|--number : Number 0f dice to use                                           |"
    echo "|-s|--sides  : Number of sides the dice have                                   |"
    echo "--------------------------------------------------------------------------------"

    }

function error-message {

    echo "$@" >&2

    }
    
function cleanup_and_exit { # restore cursor & keyboard echo
	tput cnorm  
	stty echo 
	exit $1
    }


### COMMAND LINE PROCESSING

while [ $# -gt 0 ]; do # capturing data from command line

    case "$1" in
    
        -h | --help )
        
            usage
            exit 0
            ;;
    
        -n | --number )
        
            if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
                number_of_dice=$2
                shift
            else
                error-message "Sorry ${red}'$2'${reset} is not a valid option for number of dice." # Error message with text alurting user
                exit 1
            fi
            ;;
    
        -s | --sides )
        
            if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
                if [ $2 -lt 4 -o $2 -gt 20 ]; then
                    error-message "Dice must have between 4 to 20 sides." # Error message with text alurting user
                    exit 1
                else
                    number_of_sides=$2
                    shift
                fi
            else
                error-message "Sorry ${red}'$2'${reset} is not a valid option for number of sides." # Error message with text alurting user
                exit 1
            fi
            ;;
        * )
        
            error-message "Input ${red}'$1'${reset} has caused a error" # Error message with text alurting user
            usage
            exit 1
            ;;
    
        esac
        shift
done


### Main Script

clear


until [[ $number_of_dice =~ ^[1-9][0-9]*$ ]]; do # validates user input below
  
  read -p "Between ${green}1 and 5${reset} how many die will we role?: " number_of_dice # gets number of dice to role from user
  
done


until [ $number_of_sides -gt 3 -a $number_of_sides -lt 21 ]; do # validates user input below

  read -p "Between ${green}4 and 20${reset} how many sides will we each die have?: " number_of_sides # gets number of sides on each die from user
 
done

echo ""
echo "|-----------------|"
for (( rolls=0 ; rolls < number_of_dice ; rolls++ )); do # roll's the dice

  die1=$(($RANDOM %$number_of_sides +1))
  
  rolled=$(($die1 + $rolled))

  echo "| Die rolled : ${blue}$die1${reset}  |" # Displays the rezult of each role

done
echo "|-----------------|"
echo "| Tottal Role: ${blue}$rolled${reset} |" # Displays the rezult of the tottal role
echo "|-----------------|"
cleanup_and_exit


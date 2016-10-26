#!/bin/bash
# this script prompts the user for a count of dice and then rolls them

### Variables
declare -i count
count=0  #number of dice to role.
declare -i sides
sides=0  #number of sides per die, must be between 4 and 20.
rolled=0 #Tallies the tottal role.

###Functions
function usage {
echo "Usage: $0 [-h] [-c number_of_dice] [-s 4-20]"
}

function error-message {
echo "$@" >&2
}
#Command line processing
while [ $# -gt 0 ]; do

 case "$1" in
    -h )
      usage
      exit 0
      ;;
    
    -c )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        count=$2
        shift
      else
        error-message "You gave me '$2' a the number of dice to roll, bad plan muchacho."
        exit 1
      fi
      ;;
    
    -s )
      if [[ "$2" =~ ^[1-9][0-9]*$ ]]; then
        if [ $2 -lt 4 -o $2 -gt 20 ]; then
          error-message "Number of sides must be between 4 and 20, inclusive, fool."
          exit 1
        else
          sides=$2
          shift
        fi
      else
        error-message "You gave me '$2' a the number of sides per die, no way that's happening."
        exit 1
      fi
      ;;
    * )
      error-message "I do not understand '$1'"
      usage
      exit 1
      ::
    
 esac
 shift
done

### User input validation
# get a valid roll count from the user
until [[ $count =~ ^[1-9][0-9]*$ ]]; do
  read -p "How many dice shall I roll[1-5]? " count
done

# get a valid side count from the user
until [ $sides -gt 3 -a $sides -lt 21 ]; do
  read -p "How many sides should each die have [4-20]? " sides
done

### Main Script
# do the dice roll as many times as the user asked for
for (( rolls=0 ; rolls < count ; rolls++ )); do
# roll the dice
  die1=$(($RANDOM %$sides +1))
  rolled=$(($die1 + $rolled))
# show the roll results
  echo "Rolled: $die1"
done

echo "Tottal Role: $rolled"












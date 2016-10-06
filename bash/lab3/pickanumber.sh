#!/bin/bash

#This program generates a random number from 1 to 10 then will ask for user
#input untill they guess correctly 

#Varables START

randomnumber=$((1+ $RANDOM %10))

#Varalbes STOP

while true; do

  echo -n "Guess a number from 1 to 10: "; read userguess;

  if [ -n "$userguess" ]; then
        if [ $userguess -eq $randomnumber ]; then
           echo "Hurrah! You guessed correctly. it was $randomnumber."
           echo ""
           break
           
        elif [ "$userguess" = "q" ]; then
           echo "bye."
           echo ""
        break
    
        else
           echo "Sorry you guessed wrong try again."
           echo ""
        fi
     
  else
    echo "You didn't give me any input"
  fi

done

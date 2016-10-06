#!/bin/bash

#This program generates a random number from 1 to 10 then will ask for user
#input untill they guess correctly 

#Varables START

randomnumber=$((1+ $RANDOM %10))

#Varalbes STOP
echo ""
read -p "Guess a number from 1 to 10: " userguess
echo ""


if [ -n "$userguess" ]; then

    if [ $userguess -eq $randomnumber ]; then

        echo "Hurrah! You guessed correctly. it was $randomnumber."
  
    else
        echo "Sorry you guessed $userguess and the answer was $randomnumber."
    fi
  
else
        
    echo "You didn't give me any input"
            
fi 

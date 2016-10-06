#!/bin/bash
#
#Create an array containing 11 different food names. Create two variables with random numbers in them from 1-6 each. Add the two numbers together and use the sum as an index to display a food from your array. Name this script rollafood.sh.

#Valables START
foods=("pizza" "hotdog" "padthai" "soup" "toast" "cookies" "pie" "waffels" "apple" "vodka" "pop tart")

die1=$((1+ $RANDOM %6))
die2=$((1+ $RANDOM %6))

dicetotal=$((die1 + die2))
#Varables END

#Script START
echo "Yum, I rolled $dicetotal witch gives me ${foods[$((dicetotal - 2))]}!"
#Script END

#!/bin/bash
#
#Create an array containing 11 different food names. Create two variables with random numbers in them from 1-6 each. Add the two numbers together and use the sum as an index to display a food from your array. Name this script rollafood.sh.
#declare -a arrayvar

arrayvar=(pizza hotdog padthai soup toast cookies)

echo ${arrayvar[@]}${arrayvar[@]}

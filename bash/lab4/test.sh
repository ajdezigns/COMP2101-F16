#!/bin/bash

# function that returns the value of the "array"

value () { # returns values of the virtual array for each index passed in paramete

   #you could add checks for non-integer, negative, etc
   while [ "$#" -gt 0 ]
   do
      #you could add checks for non-integer, negative, etc
      printf "$(( ($1 - 1) * 5 + 200 ))"
      shift
      [ "$#" -gt 0 ] && printf " "
   done 
}

read -p "number " test 

value

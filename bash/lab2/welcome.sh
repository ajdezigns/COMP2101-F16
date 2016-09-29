#!/bin/bash
#
#Create a script that displays the "Welcome to planet..." output described in the presentation. Create it as described on that slide and name it welcome.sh.

#Variabils 
export MYNAME="Alex"
mytitle="Mx."

planet=`hostname`
weekday=$(date +%A)

#script
echo "Welcome to planet $planet, $mytitle$MYNAME!"
echo "Today is $weekday."



#!/bin/bash

#Notes START

#This script updates my github repo and add a update message.

#Notes STOP

#Varables START

message="$1" #This sets the VAR message to the input entered after the command


#Varables STOP

git add -A

if [[ $message = *[!\ ]* ]]; then

    git commit -m "$message"
  
        else
            read -p "Message for update:" message
            git commit -m "$message"
fi 

git push






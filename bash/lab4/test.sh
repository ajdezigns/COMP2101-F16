#!/bin/bash

while true; do
    echo "Which interface do you wish to monitor?"
        cd /sys/class/net && select interface in *; do
            
            if [ "$interface" = "" ]; then
                echo  "You didn't pick an interface. Pick a number from the list."
            else
                if [ ! -d "/sys/class/net/$interface" ]; then
                    echo  "The interface that you have chosen does not exist. Please verify."
                else
                    echo "You will be monitoring the $interface interface"
                    break
                fi
            fi
        done
    break
done

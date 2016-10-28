#!/bin/bash

#Create an array using the output of ifconfig which has the names of
#the network interfaces in it. Use those names to extract the ip 
#addresses of the interfaces, also using ifconfig output. 
#Parse the output of route -n to display the ip address of the default gateway.


### Variables

showrout=0

red=`tput setaf 1`
green=`tput setaf 2`
yellow=`tput setaf 3`
blue=`tput setaf 4`
magenta=`tput setaf 5`
cyan=`tput setaf 6`
white=`tput setaf 7`

reset=`tput sgr0`

### Functions

function usage {

    echo "----------------------------------------"
    echo "|   Help DOC for: ${red}$0${reset}    |"
    echo "----------------------------------------"
    echo "| -h|--help : Opens this help file     |"
    echo "| -r|--rout : Shows the Default Rout   |"
    echo "----------------------------------------"
}

function error-message {

    echo "$@" >&2
    
}

function ip_address {

 `ifconfig $interface 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`

}

### COMMAND LINE PROCESSING 
gotadirectory=no
while [ $# -gt 0 ]; do
    case "$1" in
    -h | --help ) # show usage diagram
        usage
        exit 0
        ;;
    -r | --rout ) # Show Default Route information
        showrout=1
        ;;
    * )
        usage; error-message
        exit 0
        ;;
    esac
    shift
done

### MAIN

if [ $showrout = 1 ];  then # If statment to check if user wants defualt gateway information

    gatewayip=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`

    cat <<EOF
    
    The default gateway is $gatewayip
    
EOF
    else
    
while true; do # Loop pulling in the names of interfaces on the computer
    echo "Which interface do you wish to monitor?${green}"
        cd /sys/class/net && select interface in *; do
            
            if [ "$interface" = "" ]; then
                echo  "${red}You didn't pick an interface. Pick a number from the list try again.${reset}"
            else
                if [ ! -d "/sys/class/net/$interface" ]; then
                    echo  "The interface that you have chosen does not exist. Please verify."
                else
                    echo "${reset}Interface ${blue}$interface${reset} currently has the ip of ${blue}`ifconfig $interface 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
${reset}" 
                    break
                fi
            fi
        done
    break
done



fi



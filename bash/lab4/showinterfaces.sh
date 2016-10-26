#!/bin/bash

#Create an array using the output of ifconfig which has the names of
#the network interfaces in it. Use those names to extract the ip 
#addresses of the interfaces, also using ifconfig output. 
#Parse the output of route -n to display the ip address of the default gateway.


### Variables
interfacenames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

declare -a ips
intfindex=0

showrout=0

### Functions
function usage {
    echo ""
    echo "Usage: $0  "
    echo "[-h|--help Opens this help file]"
    echo "[-r|--rout Shows the Default Rout]"
}

function error-message {
    echo "$@" >&2
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

if [ $showrout = 1 ];  then 

    gatewayip=`route -n|grep '^0.0.0.0 '|awk '{print $2}'`

    cat <<EOF
    
    The default gateway is $gatewayip
    
EOF
    else
    
    echo ""
    read -p "Please specify interface you want to see " userinterface

    while [ $intfindex -lt ${#interfacenames[@]} ]; do
        ips[$intfindex]=`ifconfig ${interfacenames[$intfindex]} | grep 'inet addr' |
                                     sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
                                     
        echo "Interface ${interfacenames[$intfindex]} has address ${ips[$intfindex]}"
        intfindex=$((intfindex + 1))
    done

fi



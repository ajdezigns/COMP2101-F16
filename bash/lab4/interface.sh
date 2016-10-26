#!/bin/bash

### Variables
interfacenames=(`ifconfig |grep '^[a-zA-Z]'|awk '{print $1}'`)

declare -a ips
intfindex=0 #initialize a counter to zero
mydata=() #declare an array outside the scope of loop


intend=0




for i in {0..${#interfacenames[@]}}; do

    ips[$intfindex]=`ifconfig ${interfacenames[$intfindex]} | grep 'inet addr' |
            sed -e 's/  *inet addr://'| sed -e 's/ .*//'`
    
    mydata[idx]=`printf " ${interfacenames[$intfindex]} ${ips[$intfindex]} " $i`
    
    #echo "Interface ${interfacenames[$intfindex]} has address ${ips[$intfindex]}"
    
    intfindex=$((intfindex + 1))
    
done
echo ""
echo ${mydata[@]}
echo ""




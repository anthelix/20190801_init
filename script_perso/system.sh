#!/bin/bash

set -e
set -o pipefail
set -u


DNSCLIENT=/var/run/resolv.conf
#----------------
# VARIABLES
#----------------
OUTPUT="Info $(date +'%d-%m-%Y').info.txt"
#----------------
#Function
#----------------

print_title()
{
    echo "blablabla">>$OUTPUT
    echo "------------------------------------------" >>$OUTPUT
    echo "$@" >>$OUTPUT
    echo "------------------------------------------" >>$OUTPUT
}
#check_root()
#{
#    local meid=$(id -u)
#    if [ $meid -ne 0 ]
#    then
#	echo "Be root to use the script"
#	exit 999
#    fi
#}


#-----------------
#code
#-----------------


check_machine()
{
    echo "Hostname: $(hostname)" >$OUTPUT
    echo "Check point at $(date)" >>$OUTPUT
    #if solus
    print_title "Information reseau"
    echo "Interface Reseau: $(ifconfig -l)" >>$OUTPUT
    echo "Adresse MAC de la carte WI-Fi:$(ifconfig wlp1s0 | awk '/HWaddr/{print $5}')" >>$OUTPUT
    #echo DNS cat $DNS | grep "nameserver \([0-2]\)"| cut -d ' ' -f2
    print_title "Broadcast and IP sous reseau "
    BROAD=$(ifconfig wlp1s0 | grep Bcast | cut -d : -f3 | cut -d ' ' -f1)
    echo "Broadcast: $BROAD" >>$OUTPUT
    
   


    
    #if mac
    #print_title "Information reseau"
    #echo "Interface Reseau: $(ifconfig -l)" >>$OUTPUT
    #echo "Adresse MAC de la carte WI-Fi:$(ifconfig en1 ether | awk '/ether/{print $2}')" >>$OUTPUT
    #echo "Gateway : $(netstat -nr | grep 'en0'| awk '/default/{print $2}')" >>$OUTPUT
    #echo "cat DNSCLIENT" >>$OUTPUT
    #print_title "Broadcast and IP sous reseau "
    #Broad=$(ifconfig en0 | grep broadcast | cut -d ' '  -f6)
    #echo "Broadcast: $BROAD" >>$OUTPUT
    #echo "Adresses IP du sous reseeau : $(arp -a)" >>$OUTPUT 
     
    
}

#check_root
check_machine

#faire un rm du fichier ensuite?

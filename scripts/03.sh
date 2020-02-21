#!/bin/bash


#----------------
#Files
#---------------

#----------------
# VARIABLES
#----------------
OUTPUT="Info.$(date +'%d-%m-%Y').info.txt"


#----------------
# FUNCTION
#----------------
print_title()
{
    echo "">>$OUTPUT
    echo "------------------------------------------" >>$OUTPUT
    echo "\033[35;1m   $@\033[0m" >>$OUTPUT
    echo "------------------------------------------" >>$OUTPUT
}

#check_root()
#{
#    local meid=$(id -u)
#    if [ $meid -ne 0 ]
#    then
#   echo "Be root to use the script"
#   exit 999
#    fi
#}
check_machine()
{
    echo "\033[1mCheck point at $(date)\033[0m" >$OUTPUT
    print_title "Broadcast and IP sous reseau"
    echo "\033[1m*\033[0m Broadcast: $(ip -4 a show enp0s3 | awk '/brd/{print $4}')" >>$OUTPUT
    echo "\033[1m*\033[0m Gateway: $(ip r | awk '/default/{print $3}')" >>$OUTPUT
    echo "\033[1m*\033[0m Adresse IP du serveur Debian: $(hostname -I)" >>$OUTPUT
    echo "\033[1m*\033[0m Hostname: $(hostname)" >>$OUTPUT

    print_title "User time"
    echo "\033[1m*\033[0m Uptime: $(uptime)" >>$OUTPUT
    echo "\033[1m*\033[0m Currently connected: $(w)" >>$OUTPUT
    echo "\033[1m*\033[0m Last logins: $(last -a | head -3)" >>$OUTPUT

    print_title "Disk et Memoire"
    echo "\033[1m*\033[0m Free/Total memory disk: $(df -h | awk '/sda1/{print $4 "/" $2}')" >>$OUTPUT
    echo "\033[1m*\033[0m Free/Total memory user: $(df -h | awk '/user/{print $4 "/" $2}')" >>$OUTPUT
    echo "\033[1m*\033[0m Most expensive processes: $(top -b -n 1 | head -n 12)" >>$OUTPUT

    print_title "FINISH"
}

#-----------------
# CODE
#-----------------

check_root
check_machine
cat $OUTPUT
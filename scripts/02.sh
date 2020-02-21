#!/bin/bash
ARG1=${1:?"Enter the login, please"}
VAR_W=$(who | grep $ARG1 | awk '$1 ~/'$ARG1'/ {print $1}')
VAR_ID=$(cat /etc/passwd | awk -F: '/'$ARG1'/{print $3}')
if test -z $VAR_W
then
    echo "No $ARG1 right now"
else
    echo "The login is $ARG1 and the Id is $VAR_ID."
    echo "The $ARG1's killer is processing ... "
    sleep 3
    sudo killall -KILL -u $ARG1
    sudo userdel -r $ARG1
    sed -n '/"$ARG1"/{p;q}' /etc/passwd
fi
echo "So, "$ARG1" doesn't exist"
#!/bin/bash

set -e
set -o pipefail
set -u 

#-----------------
#VARIABLES
#-----------------

LIMIT=$1
P=$PWD

#----------------
#
#----------------

for ((i=1; i <= LIMIT; i++))
do
    P=$P/..
done
cd $P
    

#!/bin/bash

######################################
# Date: Oct 25th 2017                #
# Author:                            #
#  - Bobby I.                        #
# Email:                             #
# <bobby@bobbyiliev.com>             #
######################################

# Modify the allowedSleep var if you would like to kill the sleeping processes quicker

allowedsleep=60

sleepingProc=$(mysqladmin proc | grep Sleep)

for i in $(mysql -e 'show processlist' | grep 'Sleep' | awk '{print $1}'); do
	sleeptime=$(mysqladmin proc | grep "\<$i\>" | grep -v '\-\-' | grep -v 'Time' | awk -F'|' '{ print $7 }' | sed 's/ //g' | tail -1);
	sleeptime=$((sleeptime + 1))
        echo "${i} has been sleeping for ${sleeptime} seconds"

	if [ "$sleeptime" -gt "$allowedsleep" ]; then
               	echo "Killed proccess: ${i} as it has been sleeping for more than ${allowedsleep} seconds"; mysql -e "kill ${i}";
               	prockilled=$((prockilled+1));
	fi

done

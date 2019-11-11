#!/usr/bin/bash

#2019/11/06 kjb Nexus
#Cmdline version of myTest


#########################Globals#######################

TSTDIR="myTest"
LNK="latest"

#########################FailSafe#######################
whereami=`basename pwd`
if [[ $whereami = ${TSTDIR} ]]; then
	printf "%s\n" "WHERE AM I!"
	exit -2
fi


#########################Main#######################
#Command line test
#ls [0-9]* | sort -Vr 

FN_LATEST=`ls [0-9]* | sort -Vr |head -1`
retval=$?

if [[ $retval -ne 0 ]]; then
	printf "%s\n" "FAILED! GO HOME!"
	exit -3
fi

printf "%s\n" ${FN_LATEST}

#Clear and create new link
if [[ -L ${FN_LATEST} ]]; then
	rm ${LNK}
	retval=$?
	if [[ $retval -ne 0 ]]; then
		printf "%s\n" "Failure to remove existing link!"
		exit -1
	fi
fi

##Create link
retout=`ln -s ${FN_LATEST} ${LNK}`
retval=$?

if [[ $retval -eq 0 ]]; then
	exit 0
else
	printf "%s\n"  "Error creating link!"
	exit -1
fi



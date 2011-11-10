#!/bin/bash

##########
# Procedural vs. Non-procedural
# - return 1 indicate that file is procedural
##########

declare -a NUM
declare -a IMPORTANCE


NAME=`${COMMON_SCRIPTS}saxon.sh 'template_name_count'`
MATCH=`${COMMON_SCRIPTS}saxon.sh 'template_match_count'`

if [ "$MATCH" == "0" ]; then
	if [ "$NAME" == "0" ]; then
		# using default XSLT rules  =>  non-procedural
		echo 0
	else
		# some NAME and any MATCH  =>  procedural
		echo 1
	fi
else
	# NAME : MATCH > 2 : 1  =>  procedural (other non-procedural)
	echo `expr \( $NAME / $MATCH \) \> 2`
fi

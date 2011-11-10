#!/bin/bash

##########
# Google Search
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}saxon.sh 'google_variable_name'`
IMPORTANCE[0]=1

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh 'XSL to format the search output for Google Search Appliance'`
IMPORTANCE[1]=10

NUM[2]=`${COMMON_SCRIPTS}file_substr.sh 'Google Search Appliance'`
IMPORTANCE[2]=5


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 2`

#!/bin/bash

##########
# RSS - templates generated XML in RSS format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'rss'`
IMPORTANCE[0]=1

NUM[1]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'rss'`
IMPORTANCE[1]=10

NUM[2]=`${COMMON_SCRIPTS}file_substr.sh '<rss'`
IMPORTANCE[2]=10

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'rdf'`
IMPORTANCE[3]=10

NUM[4]=`${COMMON_SCRIPTS}file_substr.sh '<rdf:rdf'`
IMPORTANCE[4]=10

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'channel'`
IMPORTANCE[5]=3

NUM[6]=`${COMMON_SCRIPTS}file_substr.sh '<channel'`
IMPORTANCE[6]=3

NUM[7]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'item'`
IMPORTANCE[7]=1

NUM[8]=`${COMMON_SCRIPTS}file_substr.sh '<item'`
IMPORTANCE[8]=1


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 8`

#!/bin/bash

##########
# RGML -  templates generated XML in RGML format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'rgml'`
IMPORTANCE[0]=1

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh 'rgml'`
IMPORTANCE[1]=1

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'bag'`
IMPORTANCE[2]=2

NUM[3]=`${COMMON_SCRIPTS}file_substr.sh '<rdf:bag'`
IMPORTANCE[3]=2

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'seq'`
IMPORTANCE[4]=2

NUM[5]=`${COMMON_SCRIPTS}file_substr.sh '<rdf:seq'`
IMPORTANCE[5]=2


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 5`

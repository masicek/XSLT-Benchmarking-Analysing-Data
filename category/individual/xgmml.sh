#!/bin/bash

##########
# XGMML
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'xgmml'`
IMPORTANCE[0]=8

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh 'xgmml'`
IMPORTANCE[1]=5

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'graph'`
IMPORTANCE[2]=5

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'node'`
IMPORTANCE[3]=3

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'edge'`
IMPORTANCE[4]=3

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'graphic'`
IMPORTANCE[5]=1

NUM[6]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'att'`
IMPORTANCE[6]=1


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 6`

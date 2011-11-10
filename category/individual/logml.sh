#!/bin/bash

##########
# LogML
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'logml'`
IMPORTANCE[0]=12

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh 'logml'`
IMPORTANCE[1]=4

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'logml'`
IMPORTANCE[2]=8

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_name_substr' 'logml'`
IMPORTANCE[3]=4

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'hosts'`
IMPORTANCE[4]=1

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'domains'`
IMPORTANCE[5]=1

NUM[6]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'directories'`
IMPORTANCE[6]=1

NUM[7]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'userAgents'`
IMPORTANCE[7]=1

NUM[8]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'referers'`
IMPORTANCE[8]=1

NUM[9]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'keywords'`
IMPORTANCE[9]=1


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 9`

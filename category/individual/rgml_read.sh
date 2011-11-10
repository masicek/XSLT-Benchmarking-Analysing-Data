#!/bin/bash

##########
# RGML - template for reading and showing XML in RGML format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'rgml'`
IMPORTANCE[0]=8

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh 'rgml'`
IMPORTANCE[1]=1

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdf:'`
IMPORTANCE[2]=1

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdf:seq'`
IMPORTANCE[3]=2

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdf:bag'`
IMPORTANCE[4]=2


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 4`

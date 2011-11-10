#!/bin/bash

##########
# RDF - template for reading and showing XML in RDF format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'rdf'`
IMPORTANCE[0]=1

NUM[1]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdf'`
IMPORTANCE[1]=5

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'description'`
IMPORTANCE[2]=5

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'bag'`
IMPORTANCE[3]=2

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'seq'`
IMPORTANCE[4]=2

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'alt'`
IMPORTANCE[5]=2


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 5`

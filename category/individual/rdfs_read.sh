#!/bin/bash

##########
# RDFS - template for reading and showing XML in RDFS format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'rdfs'`
IMPORTANCE[0]=1

NUM[1]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdf'`
IMPORTANCE[1]=1

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdfs'`
IMPORTANCE[2]=2

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'description'`
IMPORTANCE[3]=5

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'Class'`
IMPORTANCE[4]=3

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'subClassOf'`
IMPORTANCE[5]=3

NUM[6]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'bag'`
IMPORTANCE[6]=2

NUM[7]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'seq'`
IMPORTANCE[7]=2

NUM[8]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'alt'`
IMPORTANCE[8]=2



echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 8`

#!/bin/bash

##########
# Graphml
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'graphml'`
IMPORTANCE[0]=8

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh 'graphml'`
IMPORTANCE[1]=3

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_name_substr' 'generatenodes'`
IMPORTANCE[2]=2

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_name_substr' 'generateedges'`
IMPORTANCE[3]=2

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'graphml'`
IMPORTANCE[4]=8

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'graph'`
IMPORTANCE[5]=1

NUM[6]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'edge'`
IMPORTANCE[6]=1

echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 6`

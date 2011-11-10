#!/bin/bash

##########
# RDF - templates generated XML in RDF format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'rdf'`
IMPORTANCE[0]=10

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh '<rdf:rdf'`
IMPORTANCE[1]=10

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'Description'`
IMPORTANCE[2]=4

NUM[3]=`${COMMON_SCRIPTS}file_substr.sh '<rdf:Description'`
IMPORTANCE[3]=4


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 3`

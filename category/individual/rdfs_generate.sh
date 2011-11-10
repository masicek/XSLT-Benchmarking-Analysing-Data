#!/bin/bash

##########
# RDFS - templates generated XML in RDFS format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'rdf'`
IMPORTANCE[0]=10

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh '<rdf:rdf'`
IMPORTANCE[1]=10

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'Class'`
IMPORTANCE[2]=4

NUM[3]=`${COMMON_SCRIPTS}file_substr.sh '<rdfs:Class'`
IMPORTANCE[3]=4

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'subClassOf'`
IMPORTANCE[4]=2

NUM[5]=`${COMMON_SCRIPTS}file_substr.sh '<rdfs:subClassOf'`
IMPORTANCE[5]=2

NUM[6]=`${COMMON_SCRIPTS}file_substr.sh 'http://www.w3.org/2000/01/rdf-schema#Class'`
IMPORTANCE[6]=2


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 6`

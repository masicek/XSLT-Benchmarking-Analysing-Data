#!/bin/bash

##########
# RSS - template for reading and showing XML in RSS format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rss'`
IMPORTANCE[0]=10

NUM[1]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'rdf'`
IMPORTANCE[1]=10

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'channel'`
IMPORTANCE[2]=3

NUM[3]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'item'`
IMPORTANCE[3]=1

NUM[4]=`${COMMON_SCRIPTS}file_name_substr.sh 'rss'`
IMPORTANCE[4]=8

NUM[5]=`${COMMON_SCRIPTS}file_name.sh 'navlist.xslt'`
IMPORTANCE[5]=13

NUM[6]=`${COMMON_SCRIPTS}file_name.sh 'newsfeeds.xslt'`
IMPORTANCE[6]=13


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 6`

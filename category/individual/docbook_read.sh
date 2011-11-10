#!/bin/bash

##########
# DocBook - template for reading and showing XML in DocBook format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}file_name_substr.sh 'docbook'`
IMPORTANCE[0]=5

NUM[1]=`${COMMON_SCRIPTS}file_name_substr.sh 'docbook.sourceforge.net'`
IMPORTANCE[1]=6

NUM[2]=`${COMMON_SCRIPTS}file_substr.sh 'docbook.dtd'`
IMPORTANCE[2]=9

NUM[3]=`${COMMON_SCRIPTS}file_substr.sh 'This file is part of the XSL DocBook Stylesheet distribution'`
IMPORTANCE[3]=11

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'chapter'`
IMPORTANCE[4]=1

NUM[5]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'abstract'`
IMPORTANCE[5]=1

NUM[6]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'section'`
IMPORTANCE[6]=1

NUM[7]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'bibliography'`
IMPORTANCE[7]=1

NUM[8]=`${COMMON_SCRIPTS}saxon.sh 'template_match_substr' 'footnote'`
IMPORTANCE[8]=1


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 8`

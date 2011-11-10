#!/bin/bash

##########
# DocBook - templates generated XML in DocBook format
##########

declare -a NUM
declare -a IMPORTANCE


NUM[0]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'chapter'`
IMPORTANCE[0]=1

NUM[1]=`${COMMON_SCRIPTS}file_substr.sh '<chapter'`
IMPORTANCE[1]=1

NUM[2]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'abstract'`
IMPORTANCE[2]=1

NUM[3]=`${COMMON_SCRIPTS}file_substr.sh '<abstract'`
IMPORTANCE[3]=1

NUM[4]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'section'`
IMPORTANCE[4]=1

NUM[5]=`${COMMON_SCRIPTS}file_substr.sh '<section'`
IMPORTANCE[5]=1

NUM[6]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'bibliography'`
IMPORTANCE[6]=1

NUM[7]=`${COMMON_SCRIPTS}file_substr.sh '<bibliography'`
IMPORTANCE[7]=1

NUM[8]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'footnote'`
IMPORTANCE[8]=1

NUM[9]=`${COMMON_SCRIPTS}file_substr.sh '<footnote'`
IMPORTANCE[9]=1

NUM[10]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'literallayout'`
IMPORTANCE[10]=1

NUM[11]=`${COMMON_SCRIPTS}file_substr.sh '<literallayout'`
IMPORTANCE[11]=1

NUM[12]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'editor'`
IMPORTANCE[12]=1

NUM[13]=`${COMMON_SCRIPTS}file_substr.sh '<editor'`
IMPORTANCE[13]=1

NUM[14]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'bibliosource'`
IMPORTANCE[14]=1

NUM[15]=`${COMMON_SCRIPTS}file_substr.sh '<bibliosource'`
IMPORTANCE[15]=1

NUM[16]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'acronym'`
IMPORTANCE[16]=1

NUM[17]=`${COMMON_SCRIPTS}file_substr.sh '<acronym'`
IMPORTANCE[17]=1

NUM[18]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'footnoteref'`
IMPORTANCE[18]=1

NUM[19]=`${COMMON_SCRIPTS}file_substr.sh '<footnoteref'`
IMPORTANCE[19]=1

NUM[20]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'sect1'`
IMPORTANCE[20]=1

NUM[21]=`${COMMON_SCRIPTS}file_substr.sh '<sect1'`
IMPORTANCE[21]=1

NUM[22]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'sect2'`
IMPORTANCE[22]=1

NUM[23]=`${COMMON_SCRIPTS}file_substr.sh '<sect2'`
IMPORTANCE[23]=1

NUM[24]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'sect3'`
IMPORTANCE[24]=1

NUM[25]=`${COMMON_SCRIPTS}file_substr.sh '<sect3'`
IMPORTANCE[25]=1

NUM[26]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'sect4'`
IMPORTANCE[26]=1

NUM[27]=`${COMMON_SCRIPTS}file_substr.sh '<sect4'`
IMPORTANCE[27]=1

NUM[28]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'sect5'`
IMPORTANCE[28]=1

NUM[29]=`${COMMON_SCRIPTS}file_substr.sh '<sect5'`
IMPORTANCE[29]=1

NUM[30]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'glossary'`
IMPORTANCE[30]=1

NUM[31]=`${COMMON_SCRIPTS}file_substr.sh '<glossary'`
IMPORTANCE[31]=1

NUM[32]=`${COMMON_SCRIPTS}saxon.sh 'element_name' 'glosslist'`
IMPORTANCE[32]=1

NUM[33]=`${COMMON_SCRIPTS}file_substr.sh '<glosslist'`
IMPORTANCE[33]=1


echo `${COMMON_SCRIPTS}sum.sh "${NUM[*]}" "${IMPORTANCE[*]}" 33`

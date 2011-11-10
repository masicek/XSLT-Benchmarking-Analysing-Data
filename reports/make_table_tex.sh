#!/bin/bash

NAME=$1
LINES=$2
if [ "$LINES" == "" ]; then
	LINES=0
fi

head -n1 ${NAME}.csv | sed 's/;/;\\bf /g' | sed 's/^/\\bf /' | sed 's/Number of/\\#/g' > ${NAME}.tmp
sed '1d' ${NAME}.csv | sed 's/#/\\#/' | 
	sed 's/\([0-9]\)\([0-9][0-9][0-9]\)$/\1\\,\2/g' | 
	sed 's/\([0-9]\)\([0-9][0-9][0-9]\);/\1\\,\2;/g' |
	sed 's/\([0-9]\)\([0-9][0-9][0-9]\)-/\1\\,\2-/g' >> ${NAME}.tmp
${CSV2TEX} --nohead --noescape --lines $LINES --separator s --position r ${NAME}.tmp > ${NAME}.tex
rm ${NAME}.tmp

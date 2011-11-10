#!/bin/bash

# test if file have name getted by parameter

FILE_NAME=`echo $FILE | sed 's/^\(.*\/\)\([^/]*\)$/\2/' | tr '[:upper:]' '[:lower:]'`
PATTERN=`echo $1 | tr '[:upper:]' '[:lower:]'`

if [ "$FILE_NAME" = "$PATTERN" ]; then
	echo '1'
else
	echo '0'
fi

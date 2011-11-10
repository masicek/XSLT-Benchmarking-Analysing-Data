#!/bin/bash

##########
# For each XSLT in DATA run individual script for category
# and determine if XSLT is 'in' or 'out' of category
# or it is necessary recognyze the XSLT by hand ('middle')
##########

CATEGORY_NAME=$1
LIMIT_A=$2
LIMIT_B=$3

CATEGORIES_SCRIPTS=./individual/
COMMON_SCRIPTS=${CATEGORIES_SCRIPTS}common/; export COMMON_SCRIPTS

export FILE
for FILE in `cat $FILES`
do
	VALUE=`${CATEGORIES_SCRIPTS}$CATEGORY_NAME.sh`
	
	if [ "$VALUE" == "" ]; then
		TYPE="error"
		VALUE="0"
	elif [ $VALUE -lt $LIMIT_A ]; then
		TYPE="out"
	elif [ $VALUE -ge $LIMIT_B ]; then
		TYPE="in"
	else
		TYPE="middle"
	fi
	
	echo "$FILE $TYPE $VALUE" >> ${REPORT}files_${CATEGORY_NAME}
done

echo ${CATEGORY_NAME} >> $CATEGORIES

echo "Getting list of files in category '$CATEGORY_NAME' DONE"

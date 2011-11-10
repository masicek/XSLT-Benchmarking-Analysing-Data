#!/bin/bash

##########
# Report count of files in each category
##########

DATA=$1
NAMES=${DATA}categories_list
NUMBER=${2}categories_numbers


echo 'category;in;middle;out;error' > $NUMBER

for NAME in `cat $NAMES`
do
	echo -n "$NAME" >> $NUMBER
	cut ${DATA}files_${NAME} -f2 -d' ' | sort | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' > ${NUMBER}_tmp
	
	for TYPE in `echo 'in middle out error'`
	do
		VAL=`cat ${NUMBER}_tmp | grep $TYPE | cut -f2 -d';'`
		if [ "$VAL" == "" ]; then
			VAL=0
		fi
		echo -n ";$VAL" >> $NUMBER
	done
	
	echo '' >> $NUMBER
done

rm ${NUMBER}_tmp

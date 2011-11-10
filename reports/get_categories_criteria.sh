#!/bin/bash

##########
# Get criteria as CSV and TeX table for all categories
##########


DATA=$1
NAMES=${DATA}categories_list
INPUT_DIR=$2
OUTPUT_DIR=$3


for NAME in `cat $NAMES`
do
	./get_category_criteria.sh $NAME $INPUT_DIR $OUTPUT_DIR
done
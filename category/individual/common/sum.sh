#!/bin/bash

# count sum of tests on one file for one category
# required parameters are NUM, IMPORTANCE and NUMER_OF_TESTS

declare -a NUM
declare -a IMPORTANCE


NUM=($1)
IMPORTANCE=($2)
MAX_INDEX=$3


# make sum of tests
VALUE=0
for I in `seq 0 $MAX_INDEX`
do
	VALUE=`expr $VALUE + \( ${NUM[$I]} \* ${IMPORTANCE[$I]} \)`
done

echo $VALUE

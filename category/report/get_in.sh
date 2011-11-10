#!/bin/bash

################
# Copy files marked as "in category" or "middel category" into separete directory
################

#mkdir ./data

# IN
TYPE='in'
for NAME in docbook_read
do
	mkdir ./data/${NAME}_${TYPE}
	cat ./files_${NAME} | grep "${TYPE} " | cut -f1 -d' ' | sed "s/^\(.*\)\/\([^/]*\)$/cp ..\/\1\/\2 .\/data\/${NAME}_${TYPE}\/\2/" > ./data/${NAME}_${TYPE}_tmp.sh
	chmod 770 ./data/${NAME}_${TYPE}_tmp.sh
done

# MIDDLE
TYPE='middle'
for NAME in docbook_read
do
	mkdir ./data/${NAME}_${TYPE}
	cat ./files_${NAME} | grep "${TYPE} " | cut -f1 -d' ' | sed "s/^\(.*\)\/\([^/]*\)$/cp ..\/\1\/\2 .\/data\/${NAME}_${TYPE}\/\2/" > ./data/${NAME}_${TYPE}_tmp.sh
	chmod 770 ./data/${NAME}_${TYPE}_tmp.sh
done


ls ./data/*_tmp.sh > ./tmp
bash ./tmp
rm ./tmp
rm ./data/*_tmp.sh

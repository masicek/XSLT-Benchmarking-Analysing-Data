#!/bin/bash

##########
# Reposrtg all features for all files in each category separately
##########

# TODO ... pis az co mi vyleze za seznamy, tak to mozna udelam rucne


NAMES=${1}categories_list
LISTS=${2}/report/
REPORT${2}/


# make lists of files included into categories
for NAME in `cat $NAMES`
do
	# category dir
	mkdir ${LISTS}${NAME}
	
	for FILE in `depth_files fanout_files recursion_files  version_files nesting_elements size_files`
	do
		# report limited on category
		??? > ${LISTS}${NAME}/${FILE}
	done
	
	# run scan on limited report
#	./scan_all.sh "${LISTS}${NAME}"	
	
done


# TODO ./scan_all.sh ??? ???

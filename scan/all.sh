#!/bin/bash

##########
# Scan all files
#	- gettnig list of files
#	- scan all files and report their features
##########


DATA=../data/
#DATA=../data_test/
#REPORT=./report/
REPORT=./report_test/
LOG=./log
echo -n '' > $LOG

FILES=${REPORT}files_list
ELEMENTS=${REPORT}elements_numbers
DEPTH=${REPORT}depth_files
VERSION=${REPORT}version_files
XPATH=${REPORT}xpath_list
SIZE=${REPORT}size_files
FANOUT=${REPORT}fanout_files
NESTING=${REPORT}nesting_elements
RECURSION=${REPORT}recursion_files
OUTPUT=${REPORT}output_files
PROCEDURAL=${REPORT}procedural_files


# Get list of files for scaning (exclude files includes PHP parts)
#find $DATA -type f -iregex '.*[.]xsl.*' | sort > ${FILES}_all
#for FILE in `find $DATA -type f`; do grep -H -E '<\?php' "$FILE"; done | cut -f1 -d: | sort | uniq >  ${FILES}_problem_php_tmp
#for FILE in `find $DATA -type f`; do grep -H -E '<\? '   "$FILE"; done | cut -f1 -d: | sort | uniq >> ${FILES}_problem_php_tmp
#cat ${FILES}_problem_php_tmp | sort | uniq > ${FILES}_problem_php
#rm ${FILES}_problem_php_tmp
#comm -3 ./${FILES}_all ./${FILES}_problem_php > $FILES

echo 'Getting list of files DONE'

# Scaning all files in list
./scan.php -f $FILES -e $ELEMENTS -d $DEPTH -v $VERSION -x $XPATH -o $FANOUT -n $NESTING -r $RECURSION -p $OUTPUT -a $PROCEDURAL >> $LOG

echo 'Scanning DONE'

# Get sizes of files
du -b `find $DATA -type f -iregex '.*[.]xsl.*'` | sed 's/^\([^\t]*\)\t\([^\t]*\)/\2 \1/' > $SIZE

echo 'Getting size DONE'



#!/bin/bash

##########
# Report all features all files together into files in CSV format, separated by ';'.
# Generate graphs and tables.
##########

DATA=$1
VERSION_IN=${DATA}version_files
DEPTH_IN=${DATA}depth_files
SIZE_IN=${DATA}size_files
ELEMENTS_IN=${DATA}elements_numbers
FANOUT_IN=${DATA}fanout_files
NESTING_IN=${DATA}nesting_elements
RECURSION_IN=${DATA}recursion_files
OUTPUT_IN=${DATA}output_files
PROCEDURAL_IN=${DATA}procedural_files
#XPATH_IN=${DATA}xpath_list


REPORT=$2
DEPTH_OUT=${REPORT}depth_files
VERSION_OUT=${REPORT}version_files
SIZE_OUT=${REPORT}size_files
ELEMENTS_OUT=${REPORT}elements_numbers
FANOUT_OUT=${REPORT}fanout_files
NESTING_OUT=${REPORT}nesting_elements
RECURSION_OUT=${REPORT}recursion_files
OUTPUT_OUT=${REPORT}output_files
PROCEDURAL_OUT=${REPORT}procedural_files
#XPATH_OUT=${REPORT}xpath_list



# DEPTH
#echo 'Maximal depth;Number of files' > ${DEPTH_OUT}.csv
#cut $DEPTH_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${DEPTH_OUT}.csv
#./graph_depth.sh ${DEPTH_OUT}
#./make_table_tex.sh ${DEPTH_OUT}


# NESTING
#cut $NESTING_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' > ${NESTING_OUT}_foreach.tmp
#cut $NESTING_IN -f3 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' > ${NESTING_OUT}_if.tmp
#cut $NESTING_IN -f4 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' > ${NESTING_OUT}_choose.tmp
#MAX=`cat ${NESTING_OUT}_foreach.tmp ${NESTING_OUT}_choose.tmp ${NESTING_OUT}_if.tmp | cut -d\; -f1 | sort -n | tail -1`
#echo 'Depth of nesting;Foreach;Choose;If' > ${NESTING_OUT}.csv
#for NESTING in `seq 0 $MAX`; do
#	VALUE_FOREACH=`cat ${NESTING_OUT}_foreach.tmp | grep "^${NESTING};" | cut -d\; -f2`
#	if [ "$VALUE_FOREACH" == "" ]; then VALUE_FOREACH="0"; fi
#	VALUE_CHOOSE=`cat ${NESTING_OUT}_choose.tmp | grep "^${NESTING};" | cut -d\; -f2`
#	if [ "$VALUE_CHOOSE" == "" ]; then VALUE_CHOOSE="0"; fi
#	VALUE_IF=`cat ${NESTING_OUT}_if.tmp | grep "^${NESTING};" | cut -d\; -f2`
#	if [ "$VALUE_IF" == "" ]; then VALUE_IF="0"; fi
#	
#	echo "${NESTING};${VALUE_FOREACH};${VALUE_CHOOSE};${VALUE_IF}" >> ${NESTING_OUT}.csv
#done
#rm ${NESTING_OUT}_foreach.tmp ${NESTING_OUT}_if.tmp ${NESTING_OUT}_choose.tmp 
#./graph_nesting.sh ${NESTING_OUT}
#./make_table_tex.sh ${NESTING_OUT}


# VERISON
#echo 'Version;Number of files' > ${VERSION_OUT}.csv
#cut $VERSION_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${VERSION_OUT}.csv
#./make_table_tex.sh ${VERSION_OUT}


# FANOUT
#echo 'Maximal fan-out;Number of files' > ${FANOUT_OUT}.csv
#cut $FANOUT_IN -f4 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' | sed 's/^\(;.*\)$/0\1/' >> ${FANOUT_OUT}.csv
#echo ';' >> ${FANOUT_OUT}.csv
#./graph_fanout.sh ${FANOUT_OUT}
#./make_table_tex.sh ${FANOUT_OUT} 32
#cp ${FANOUT_OUT}.tex ${FANOUT_OUT}.tmp
#cat ${FANOUT_OUT}.tmp | sed 's/Maximal fan-out/Fan-out/' > ${FANOUT_OUT}.tex
#rm ${FANOUT_OUT}.tmp
#cat ${FANOUT_OUT}.csv | sed '$d' > tmp
#cat tmp > ${FANOUT_OUT}.csv
#rm tmp
# avg
#echo 'Avg fanout;Number of files' > ${FANOUT_OUT}_avg.csv
#cut $FANOUT_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${FANOUT_OUT}_avg.csv


# SIZE
#GROUP_DIVERGENCE=10000
#echo -n '' >> ${SIZE_OUT}.tmp
#for SIZE in `cut $SIZE_IN -f2 -d' '`; do
#	MIN=`expr \( $SIZE \/ $GROUP_DIVERGENCE \) \* 10` # show values in kB
#	MAX=`expr \( \( $SIZE \/ $GROUP_DIVERGENCE \) + 1 \) \* 10` # show values in kB
#	echo "${MIN}-${MAX}" >> ${SIZE_OUT}.tmp
#done
#echo 'Size (kB);Number of files' > ${SIZE_OUT}.csv
#cat ${SIZE_OUT}.tmp | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${SIZE_OUT}.csv
#rm ${SIZE_OUT}.tmp
#./graph_size.sh ${SIZE_OUT}
#./make_table_tex.sh ${SIZE_OUT}


# ELEMENTS
#echo 'Element name;Number of rate' > ${ELEMENTS_OUT}.csv
#cat $ELEMENTS_IN | grep -e '^[^#]*$' | sort -nr | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${ELEMENTS_OUT}.csv
#echo ';' >> ${ELEMENTS_OUT}.csv
# with version
	#echo 'Element name;XSLT;Number of rate' > ${ELEMENTS_OUT}_hand.csv
	#cat $ELEMENTS_IN | grep -e '^[^#]*$' | sort -nr | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;;\1/' >> ${ELEMENTS_OUT}_hand.csv
	#echo ';;' >> ${ELEMENT_OUT}_hand.csv
##################################################################
# !!!! add versions of elements by hand (XSLT 1.0, 2.0, unknown) #
##################################################################
#./graph_elements.sh ${ELEMENTS_OUT}
#./make_table_tex.sh ${ELEMENTS_OUT} 29
#./make_table_tex.sh ${ELEMENTS_OUT}_hand 29


# RECURSION
#echo 'Number of recursions;Number of files' > ${RECURSION_OUT}_count.csv
#cut $RECURSION_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${RECURSION_OUT}_count.csv
#./make_table_tex.sh ${RECURSION_OUT}_count
#echo 'Max way of recursions;Number of files' > ${RECURSION_OUT}_max_way.csv
#cut $RECURSION_IN -f3 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${RECURSION_OUT}_max_way.csv
#./make_table_tex.sh ${RECURSION_OUT}_max_way


# OUTPUT
#echo 'Output;Number of files' > ${OUTPUT_OUT}.csv
#cut $OUTPUT_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${OUTPUT_OUT}.csv
#echo 'Type;Number of files' > ${OUTPUT_OUT}_used.csv
#cut $OUTPUT_IN -f2,3 -d' ' --output-delimiter='-' | sed 's/^\([^-]*\)-\([^-]*\)$/\2-\1/' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${OUTPUT_OUT}_used.csv


# PROCEDURAL vs. NON-PROCEDURAL
#echo 'Output;Number of files' > ${PROCEDURAL_OUT}.csv
#cut $PROCEDURAL_IN -f2 -d' ' | sort -n | uniq -c | sed 's/^[ ]*\([0-9]*\) \([^ ]*\)$/\2;\1/' >> ${PROCEDURAL_OUT}.csv


# XPATH
# TODO -- vyselektovavat xpath z elementu, ketere se hodne vyskytrovaly



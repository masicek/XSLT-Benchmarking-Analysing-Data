#!/bin/bash

##########
# Recognize some categories of XSLT files.
# Each category have the own approach.
##########

DATA=../data/;							export DATA
SAXON='java -jar ../../saxon9he.jar';	export SAXON
REPORT=./report/;						export REPORT
#REPORT=./report_test/;					export REPORT
FILES=${REPORT}input_files_list;		export FILES
CATEGORIES=${REPORT}categories_list;	export CATEGORIES
echo -n '' > $CATEGORIES


# Get list of files for scaning (exclude files includes PHP parts)
#find $DATA -type f -iregex '.*[.]xsl.*' | sort > ${FILES}_all
#for FILE in `find $DATA -type f`; do grep -H -E '<\?php' "$FILE"; done | cut -f1 -d: | sort | uniq >  ${FILES}_problem_php_tmp
#for FILE in `find $DATA -type f`; do grep -H -E '<\? '   "$FILE"; done | cut -f1 -d: | sort | uniq >> ${FILES}_problem_php_tmp
#cat ${FILES}_problem_php_tmp | sort | uniq > ${FILES}_problem_php
#rm ${FILES}_problem_php_tmp
#comm -3 ./${FILES}_all ./${FILES}_problem_php > $FILES

echo 'Getting list of files DONE'


# RSS
#./one_category.sh rss_read 8 13 &
#./one_category.sh rss_generate 8 13 &

# Google Search Apliance
#./one_category.sh google_search 5 10 &

# Output
#./one_category.sh output_xml 1 1 &
#./one_category.sh output_html 1 1 &
#./one_category.sh output_text 1 1 &

# Procedural (other are Non-procedural)
#./one_category.sh procedural 1 1 &

# XGMML
#./one_category.sh xgmml 6 10 &

# LOGML
#./one_category.sh logml 6 12 &

# Graphml
#./one_category.sh graphml 5 10 &

# DocBook
#./one_category.sh docbook_read 6 10 &
#./one_category.sh docbook_generate 8 12 &

# RDF
#./one_category.sh rdf_read 7 10 &
#./one_category.sh rdf_generate 10 13 &

# RDFS
#./one_category.sh rdfs_read 10 13 &
#./one_category.sh rdfs_generate 10 13 &

# RGML
#./one_category.sh rgml_read 6 10 &
#./one_category.sh rgml_generate 4 10 &



# wait for all background runnig category recognize
wait



#################################################################################
#           TODO
#################################################################################

# DBMS (export/import)
# TODO - najit na netu nejaky ukazky a podle nich zkusit udelat pravidla na detekci ... nejspis pouzit par ukazkovych dokumentu (ktere jsem stahl) jako testy

# Excel (export/import)
# TODO - kde sehnat ukazky? -- podle ni zjistit obsazene elementy atd.
# nebo jen kouknout jaky je export excelu v XML a podle toho to nastavit
# 	export - trasformace z XML vystupu Excelu, napriklad reporty ve firmach a podobne
# 	import - transformace do XML ve formatu pro Excel pripadne do CVS
# http://ewbi.blogs.com/develops/2005/01/create_excels_s.html
# http://msdn.microsoft.com/en-us/library/aa140055%28v=office.10%29.aspx
##
# XMLSS format (pro Ofice 2002 a XP)





echo 'Getting all lists categories DONE'

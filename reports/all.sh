#!/bin/bash

##########
# All reports
#   - scan all files together
#   - count of files in each category
#   - scan files in each category
##########


CSV2TEX=../../csv2latex/csv2latex; export CSV2TEX

#./scan_all.sh "../scan/report/" "./scan_all/"

# TODO spustit
#./categories_numbers.sh "../category/report/" "./category/"
./get_categories_criteria.sh "../category/report/" "../category/individual/" "./category/"

#TODO mozna udelam rucne
#./scan_categories.sh "../category/report/" "./category/"

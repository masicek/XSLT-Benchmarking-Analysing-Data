#!/bin/bash

NAME=$1
XTITLE=`head -n1 ${NAME}.csv | cut -d\; -f1`
YTITLE="Number of files"
TITLE_1=`head -n1 ${NAME}.csv | cut -d\; -f2`
TITLE_2=`head -n1 ${NAME}.csv | cut -d\; -f3`
TITLE_3=`head -n1 ${NAME}.csv | cut -d\; -f4`
LINES=6
MAX_XTICS=`expr $LINES - 1`


sed '1d' ${NAME}.csv | sed 's/;/ /g' | head -n${LINES} > ${NAME}.dat

gnuplot <<- EOF
load "setting_boxes.plt"
set output "${NAME}.eps"

set xlabel "${XTITLE}"
set ylabel "${YTITLE}"

set xtics 0,1,${MAX_XTICS}

set key

plot "${NAME}.dat" using 2 linestyle 1 title "${TITLE_1}" , \
"${NAME}.dat" using 3 linestyle 2 title "${TITLE_2}", \
"${NAME}.dat" using 4 linestyle 3 title "${TITLE_3}"

EOF

rm ${NAME}.dat

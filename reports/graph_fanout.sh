#!/bin/bash

NAME=$1
XTITLE=`head -n1 ${NAME}.csv | cut -d\; -f1`
YTITLE=`head -n1 ${NAME}.csv | cut -d\; -f2`
LINES=41
MAX_XTICS=`expr $LINES - 1`

sed '1d' ${NAME}.csv | sed 's/;/ /g' | head -n${LINES} > ${NAME}.dat

gnuplot <<- EOF
load "setting_boxes.plt"
set output "${NAME}.eps"

set xlabel "${XTITLE}"
set ylabel "${YTITLE}"

set xtics 0,2,${MAX_XTICS}

plot "${NAME}.dat" using 2 linestyle 1
EOF

rm ${NAME}.dat
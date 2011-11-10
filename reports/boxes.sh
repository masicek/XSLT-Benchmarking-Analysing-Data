#!/bin/bash

NAME=$1
TITLE=$2
#DATA_LINES=$3
#MAX_XTIC=$4

sed '1d' ${NAME}.csv | sed 's/;/ /' > ${NAME}.dat
XTITLE=`head -n1 ${NAME}.csv | sed 's/^\([^;]*\)\(;.*\)/\1/'`
YTITLE=`head -n1 ${NAME}.csv | sed 's/^\([^;]*;\)\([^;]*\)/\2/'`

gnuplot <<- EOF
load "setting_boxes.plt"
set output "${NAME}.eps"

set title "${TITLE}"
set xlabel "${XTITLE}"
set ylabel "${YTITLE}"

#set xtics 0,1,${MAX_XTIC}

# TODO
#set key # u nekterych grafy zapnout popisky ... tak kde se vypisuje vic informaci najednou

# vykresleni - vykresluju jen prvnich N radku
plot "< head -${DATA_LINES} ${NAME}.dat" linestyle 1
EOF

#rm ${NAME}.dat
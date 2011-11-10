#!/bin/bash

NAME=$1

XTICS="("
I=0
for ELEMENT in `cut -f1 -d' ' ${NAME}`; do
	XTICS="${XTICS}\"${ELEMENT}\" ${I},"
	I=`expr $I + 1`
done
XTICS=`echo ${XTICS} | sed 's/^\(.*\).$/\1/'`
XTICS="${XTICS})"

echo ${XTICS}
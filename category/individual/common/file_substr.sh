#!/bin/bash

# test hom many rows in file includes string in parameter

cat $FILE | grep -i "$1" | wc -l

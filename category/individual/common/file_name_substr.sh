#!/bin/bash

# test if file name include string getted in parameter

echo $FILE | grep -i "$1" | wc -l

#!/bin/bash

# remove comments, spaces and empty lines
# then collapse to single line
sed -e '/\#/d' -e 's/ //g' -e '/^$/d' $1 | paste -s -d ' ' > sf_list

echo install list:
cat sf_list

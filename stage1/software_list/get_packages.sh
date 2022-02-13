#!/bin/bash

# remove comments, spaces and empty lines
sed -e '/\#/d' -e 's/ //g' -e '/^$/d' $1 > sf_list

echo install list:
cat sf_list

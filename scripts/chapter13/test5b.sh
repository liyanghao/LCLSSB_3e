#!/bin/bash
# reading values from a file

file="states.txt"
IFS.OLD=$IFS
IFS=$'\n'

for state in $(cat $file)
do
    echo "Visit beautiful $state"
done
iFS=$IFS.OLD

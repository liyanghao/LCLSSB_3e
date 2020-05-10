#!/bin/bash
# 修改IFS的值

IFS.OLD=$IFS
IFS=$'\n'

for entry in $(cat /etc/passwd)
do
    echo "Values in $entry -"
    IFS=:
    for value in $entry
    do 
        echo "  $value"
    done
done

IFS=$IFS.OLD

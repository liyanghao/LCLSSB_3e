#!/bin/bash
# iterating through multiple directories

for file in /usr/bin/.b* /Users/haoliyang/Documents/GitHub/LCLSSB_3e/*
do
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    else
        echo "$file doesn't exist"
    fi
done

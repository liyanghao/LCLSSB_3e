#!/bin/bash
# Testing the test command
#
my_varibale=""
#
if test $my_varibale
then
    echo "The $my_varibale expression returns a True"
else 
    echo "The $my_varibale expression returns a False"
fi

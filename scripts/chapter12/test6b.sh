#!/bin/bash
# Testing the test command
#
my_varibale="Full"
#
if test $my_varibale
then
    echo "The $my_varibale expression returns a True"
else 
    echo "The $my_varibale expression returns a False"
fi

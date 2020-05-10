#!/bin/bash
# testing the nested section
#
testuser=NoSuchUser
#
if grep $testuser /etc/passwd
then
    echo "The bash files for user $testuser are:"
    ls -a /home/$testuser/.b*
else 
    echo "The user $testuser does not exist on this system."
fi
if ls -d /home/$testuser/ 
then
    echo "However, $testuser has a directory."
fi

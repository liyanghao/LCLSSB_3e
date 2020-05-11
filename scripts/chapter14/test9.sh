#!/bin/bash
# 测试命令行参数

if [ $# -ne 2 ]
then
    echo
    echo Usage: test9.sh a b
    echo
else 
    total=$[ $1 + $2 ]
    echo
    echo The total is $total.
    echo
fi

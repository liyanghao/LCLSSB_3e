#!/bin/bash
# 在使用命令行参数前对其进行检查

# [ -n "$1" ]是用来测试字符串$1的长度是否大于0
if [ -n "$1" ]
then
    echo Hello $1, glad to see you.
else
    echo "Sorry, you did not identify yourself."
fi

#!/bin/bash
# 获取最后一个命令行参数
#
params=$#
#
echo
echo The last parameter is $params
echo The last parameter is ${!#}
echo 

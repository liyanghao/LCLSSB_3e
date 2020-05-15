#!/bin/bash
# 读取文件，创建用于Mysql的INSER语句
#
outfile="members.sql"
IFS=','
while read lname fname address city state zip
do
    cat >> $outfile  << EOF
    INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('$lname','$fname','$address','$city','$state','$zip');
EOF
done < ${1}

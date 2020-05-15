### 例14 重定向STDOUT，然后再回到STDOUT

脚本`test14.sh`
```
#!/bin/bash
# 重定向STDOUT，然后再回到STDOUT
#
exec 3>&1
exec 1>test14out
#
echo "This should store int the output file"
echo "along with this line"
#
exec 1>&3
#
echo "Now things should be back to normal"
```

输入输出示例
```
./test14.sh
Now things should be back to normal

cat test14out 
This should store int the output file
along with this line
```

### 例15 重定向输入文件描述符

脚本`test15.sh`
```
#!/bin/bash
# 重定向输入文件描述符
#
exec 6<&0
exec 0< testfile
#
count=1
while read line
do
    echo "Line #$count: $line"
    count=$[ $count + 1 ]
done
exec 0<&6
read -p "Are you done now? " answer
case "$answer" in
Y|y) echo "Goodbye";;
N|n) echo "Sorry, this is the end.";; 
esac
```

文本`testfile`
```
This is the first line.
This is the second line.
This is the third line.
```

输入输出示例
```
./test15.sh 
Line #1: This is the first line.
Line #2: This is the second line.
Line #3: This is the third line.
Are you done now? y
Goodbye

```
### 例23 读取文件，创建用于Mysql的INSER语句

脚本`test23.sh`
```
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
```
文件`members.csv`
```
Blum,Richard,123 Main St.,Chicago,IL,60601
Blum,Barbara,123 Main St.,Chicago,IL,60601
Bresnahan,Christine,456 Oak Ave.,Columbus,OH,43201
Bresnahan,Timothy,456 Oak Ave.,Columbus,OH,43201
```

输入输出示例
```
cat members.sql
    INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('Blum','Richard','123 Main St.','Chicago','IL','60601');
    INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('Blum','Barbara','123 Main St.','Chicago','IL','60601');
    INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('Bresnahan','Christine','456 Oak Ave.','Columbus','OH','43201');
    INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('Bresnahan','Timothy','456 Oak Ave.','Columbus','OH','43201');
```











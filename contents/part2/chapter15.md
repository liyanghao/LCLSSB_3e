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
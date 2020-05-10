# 第13章 更多的结构化命令
本章的主要内容有：
- 13.1节介绍`for`循环语句
- 13.2节介绍`until`循环语句
- 13.3节介绍`while`循环语句
- 13.4节介绍综合使用多种循环语句
- 13.5节介绍如何将循环语句的输出重定向

## 13.1节 `for`循环指令

格式：
```
for var in list
do 
	commands
done
```

### 13.1.1小节 读取列表中的值
脚本`test1.sh`
```
#!/bin/bash
# 基本的for循环指令

for test in Alabama Alaska Arizona Arkansas California Colorado
do
	echo The next state is $test
done
```

脚本`test1b.sh`
```
#!/bin/bash
# 测试循环后的for变量值

for test in Alabama Alaska Arizona Arkansas California Colorado
do
    echo "The next state is $test"
done
echo "The last state we visited was $test"
test=Connecticut
echo "Wait, now we are visiting $test"
```
### 13.1.2小节 读取列表中的复合值
脚本`badtest1.sh`
```
#!/bin/bash
# another example of how not to use the for command

for test in I don't know if this'll work
do
    echo "word:$test"
done
```

脚本`test2.sh`
```
#!/bin/bash
# another example of how not to use the for command
for test in I don\'t know if this\'ll work
do
    echo "word:$test"
done
```

脚本`test2b.sh`
```
#!/bin/bash
# another example of how not to use the for command
for test in I "don't" know if "this'll" work
do
    echo "word:$test"
done
```

脚本`badtest2.sh`
```
#!/bin/bash
# another example of how not to use the for command

for test in Nevada New Hampshire New Mexico New York North Carolina
do
    echo "Now going to $test" 
done
```

脚本`test3.sh`
```
#!/bin/bash
# an example of how to properly define values

for test in Nevada "New Hampshire" "New Mexico" "New York"
do
    echo "Now going to $test"
done
```

### 13.1.3小节 从变量中读取列表
脚本`test4.sh`
```
#!/bin/bash
# using a variable to hold the list

list="Alabama Alaska Arizona Arkansas Colorado" list=$list" Connecticut"

for state in $list
do
    echo "Have you ever visited $state?" 
done
```

### 13.1.4小节 从命令中读取值
文本`states.txt`
```
Alabama
Alaska
Arizona
Arkansas
Colorado
Connecticut
Delaware
Florida
New York
New Hampshire
North Carolina
```

脚本`test5.sh`
```
#!/bin/bash
# reading values from a file

file="states"

for state in $(cat $file)
do
    echo "Visit beautiful $state"
done
```

### 13.1.5小节 如何修改字段分隔符
在bash shell中，默认的分隔符有3个：
- 空格符
- tab符
- 换行符

如果bash shell碰到这3个分隔符中的任何一个，则bash shell就假设您开始了列表中的一个新字段。

处理包含空格的数据是很烦人的，但是要怎么才能解决这个问题呢？
方法一：临时修改环境变量IFS，来修改bash shell默认的分隔符

比如，如果打算将换行符作为分隔符，则需要添加如下语句：
```
IFS=$'\n'
```
到您的脚本中，效果是bash shell将忽略在数据中的空格符和tab符。

脚本`test5b.sh`
```
#!/bin/bash
# reading values from a file

file="states.txt"
IFS.OLD=$IFS
IFS=$'\n'

for state in $(cat $file)
do
    echo "Visit beautiful $state"
done
IFS=$IFS.OLD
```

如果要临时修改IFS，则有比较好的代码示例：
```
IFS.OLD=$IFS
IFS=$'\n'
<use the new IFS value in code>
IFS=$IFS.OLD
```

### 13.1.6小节 使用`*`来读取目录
使用for循环来自动迭代一个目录下的所有文件

脚本`test6.sh`
```
#!/bin/bash
# iterate through all the files in a directory

for file in /Users/haoliyang/Documents/GitHub/LCLSSB_3e/*
do
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    elif [ -f "$file" ]
    then
        echo "$file is a file"
    fi
done
```


脚本`test7.sh`
```
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
```

注意事项：
- 您可以在列表数据中输入任何数据；
- 即使文件或者目录不存在，for循环语句也会尝试处理您在列表中输入的数据；
- 当处理文件和目录时，如果文件和目录不存在，则会有问题；
- 您是没办法知道您是否在对一个不存在的目录进行迭代的；
- 比较好的做法是：在处理目录或者文件时，先对其进行测试


## 案例

### 循环访问文件数据

```
#!/bin/bash
# 修改IFS的值

IFS.OLD=$IFS
IFS=$'\n'

for entry in $(cat /etc/passwd)
do
    echo "Values in $entry -"
    IFS=:
    for value in $entry
    do 
        echo "  $value"
    done
done

IFS=$IFS.OLD
```

### 从单循环中跳出
脚本`test17.sh`
```
#!/bin/bash
# breaking out of a for loop

for var1 in 1 2 3 4 5 6 7 8 9 10
do
    if [ $var1 -eq 5 ] 
    then
        break
    fi
    echo "Iteration number: $var1"
done
echo "The for loop is completed"
```

脚本`test18.sh`
```
#!/bin/bash
# breaking out of a while loop

var1=1

while [ $var1 -lt 10 ]
do
    if [ $var1 -eq 5 ]
    then
        break; 
    fi

    echo "Iteration: $var1"
    var1=$[ $var1+1 ]
done
echo "The while loop is completed"
```

### 从内循环从跳出
脚本`test19.sh`
```
#!/bin/bash
# breaking out of an inner loop

for (( a = 1; a < 4; a++ ))
do
    echo "Outer loop: $a"
    for (( b = 1; b < 100; b++ ))
    do
       if [ $b -eq 5 ] 
       then
	       break 
	   fi
	   echo "  Inner loop: $b"
    done
done
```

### 从外部循环中跳出
脚本`test20.sh`
```
#!/bin/bash
# breaking out of an outer loop

for (( a = 1; a < 4; a++ ))
do
	echo "Outer loop: $a"
	for (( b = 1; b < 100; b++ ))
	do
		if [ $b -gt 4 ]
		then
		    break 2
		fi
		echo "  Inner loop: $b"
	done
done
```

### 处理一个循环的输出
脚本`test23a.sh`
```
#!/bin/bash

for file in /usr/bin/*
do 
    if [ -d "$file" ]
    then
        echo "$file is a directory"
    else
    	echo "$file is a file"
    fi
done > output.txt
```

脚本`test23.sh`
```
#!/bin/bash
# redirecting the for output to a file

for (( a = 1; a < 10; a++ ))
do
    echo "The number is $a" 
done > test23.txt
```




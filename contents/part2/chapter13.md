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




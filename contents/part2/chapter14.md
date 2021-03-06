# 第14章 如何处理用户输入？
本章的主要内容有：
- 传递参数
- 记录参数
- 平移参数
- 处理可选项
- 标准选项
- 获取用户输入

## 第14.1节 给脚本传递参数

bash shell
给所有输入的命令行参数分配了特殊的变量，即位置参数，包括shell正在执行的脚本的名字。

位置参数变量是标准的数字，
其中`$0`表示脚本名字，`$1`表示第一个参数，`$2`表示第二个参数，以此类推，直到第9个参数`$9`。

### 命令行参数解释
- `$0`：脚本名
- `$1`：第一个命令行参数的名字
- `basename $0`：获取不含路径的脚本名
- `$#`：记录脚本运行时输入的命令行参数的个数
- `${$#}`：表示最后一个命令行参数
- `$*`：将所有的命令行参数当做一个参数
- `$@`：取所有的命令行参数作为同一个字符串里的单独的词

### 测试命令行参数
在脚本中使用命令行参数时要很小心。如果运行脚本时没有带参数，则会发生坏的事情。

当脚本假设在一个命令行参数里有数据，但没有传递数据时，大部分情况下，会得到一条错误消息输出。

最好能在使用命令行参数前对参数进行检查。

### 使用`getopt`命令

格式
```
getopt optstring parameters
```
使用：
- 在optstring中放入可选项字母；
- 在需要参数值的可选项字母后放入冒号`:`；
- `getopt`命令根据optstring来解析参数；

getopt的使用举例
```
$ getopt ab:cd -a -b test1 -cd test2 test3
 -a -b test1 -c -d -- test2 test3
```


### 例题
例1 使用命令行参数

脚本`test1.sh`
```
#!/bin/bash
# 使用某个命令行参数
#
factorial=1
for((number=1;number<=$1;number++))
do
    factorial=$[ $factorial * $number ]
done
echo The factorial of $1 is $factorial
```

例2 测试两个命令行参数

脚本`test2.sh`
```
#!/bin/bash
# 测试两个命令行参数
#
total=$[ $1 * $2 ]
echo The first parameter is $1.
echo The second parameter is $2.
echo The total value is $total.
```

例3 测试字符串作为命令行参数

脚本`test3.sh`
```
#!/bin/bash
# 测试字符串命令行参数
#
echo Hello $1, glad to see you.
```

例4 处理的命令行参数超过9个

脚本`test4.sh`
```
#!/bin/bash
# 处理许多命令行参数
#
total=$[ ${10} * ${11} ]
echo The tenth parameter is ${10}.
echo The eleventh parameter is ${11}.
echo The total is $total.
```

例5 读取脚本名

脚本`test5.sh`
```
#!/bin/bash
# 测试$0参数
#
echo The zero parameter is set to: $0
```

例5b 对`$0`使用`basename`命令

脚本`test5b.sh`
```
#!/bin/bash
# 对$0使用命令basename
#
name=$(basename $0)
echo
echo The script name is: $name
```

例6 测试一个具有多功能的脚本

脚本`test6.sh`
```
#!/bin/bash
# 测试多功能脚本

name=$(basename $0)

if [ $name = "addem" ]
then
    total=$[ $1 + $2 ]
elif [ $name = "multem" ]
then
    total=$[ $1 * $2 ]
fi

echo
echo The calculated value is $total 
```

例7 在使用前测试命令行参数

脚本`tesh7.sh`
```
#!/bin/bash
# 在使用命令行参数前对其进行检查

# [ -n "$1" ]是用来测试字符串$1的长度是否大于0
if [ -n "$1" ]
then
    echo Hello $1, glad to see you.
else
    echo "Sorry, you did not identify yourself."
fi
```

例8 获取命令行参数的个数

脚本`test8.sh`
```
#!/bin/bash
# 获取命令行参数的个数

echo There were $# parameters supplied.
```

例9 测试命令行参数

脚本`test9.sh`
```
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
```

例10 获取最后一个命令行参数

脚本`test10.sh`
```
#!/bin/bash
# 获取最后一个命令行参数
#
params=$#
#
echo
echo The last parameter is $params
echo The last parameter is ${!#}
echo
```
输出：
```
./test10.sh

The last parameter is 0
The last parameter is ./test10.sh

./test10.sh 1

The last parameter is 1
The last parameter is 1

./test10.sh 3  

The last parameter is 1
The last parameter is 3

```

例11 测试`$*`指令和`$@`指令

脚本`test11.sh`
```
#!/bin/bash
# 测试$*和$@
#
echo
echo "Using the \$* method: $*"
echo
echo "Using the \$@ method: $@"
```

例12 测试`$*`指令和`$@`指令

脚本`test12.sh`
```
#!/bin/bash
# 测试$*和$@
#
echo
count=1
#
for param in "$*"
do
    echo "\$* Parameter #$count = $param"
    count=$[ $count + 1 ]
done
#
echo
count=1
#
for param in "$@"
do
    echo "\$@ Parameter #$count = $param"
    count=$[ $count + 1 ]
done
```

例13 展示平移指令`shift`

脚本`test13.sh`
```
#!/bin/bash
# demonstrating the shift command
#
echo
count=1
while [ -n "$1" ]
do
    echo "Parameter #$count = $1"
    count=$[ $count + 1 ]
    shift
done
```

输出输出示例：
```
./test13.sh rich barbara katie jessica

Parameter #1 = rich
Parameter #2 = barbara
Parameter #3 = katie
Parameter #4 = jessica
```

例14 一次平移多个位置

脚本`test14.sh`
```
#!/bin/bash
# 一次平移多个位置
#
echo 
echo "The original Parameters: $*"
shift 2
echo "Here's the new first parameter: $1"
```

输入输出示例
```
./test14.sh 1 2 3 4 5

The original Parameters: 1 2 3 4 5
Here's the new first parameter: 3
```

例15 抽取简单的命令行选项作为参数

脚本`test15.sh`
```
#!/bin/bash
# 抽取简单的命令行选项作为参数
#
echo 
while [ -n "$1" ]
do
    case "$1" in
      -a) echo "Found the -a option";;
      -b) echo "Found the -b option";;
      -c) echo "Found the -c option";;
       *) echo "$1 is not an option";;
    esac
    shift
done
```

输入输出示例：
```
./test15.sh -a -b -c -d

Found the -a option
Found the -b option
Found the -c option
-d is not an option


./test15.sh -d -b -a -c

-d is not an option
Found the -b option
Found the -a option
Found the -c option
```

例16 抽取可选项和命令行参数

脚本`test16.sh`
```
#!/bin/bash
# 抽取可选项和命令行参数
#
echo 
while [ -n "$1" ]
do
    case "$1" in
    -a) echo "Found the -a option";;
    -b) echo "Found the -b option";;
    -c) echo "Found the -c option";;
    --) shift
        break;;
     *) echo "$1 is not an option";;
    esac
    shift
done
#
count=1
for param in $@
do
    echo "Parameter #$count: $param"
    count=$[ $count + 1 ]
done
```
输出输出示例：
```
./test16.sh -c -a -b test1 test2 test3

Found the -c option
Found the -a option
Found the -b option
test1 is not an option
test2 is not an option
test3 is not an option

./test16.sh -c -a -b -- test1 test2 test3

Found the -c option
Found the -a option
Found the -b option
Parameter #1: test1
Parameter #2: test2
Parameter #3: test3
```

例17 抽取命令行可选项及值

脚本`test17.sh`
```
#!/bin/bash
# 抽取可选项和命令行参数
#
echo 
while [ -n "$1" ]
do
    case "$1" in
    -a) echo "Found the -a option";;
    -b) param="$2"
        echo "Found the -b option, with parameter value $param"
        shift;;
    -c) echo "Found the -c option";;
    --) shift
        break;;
     *) echo "$1 is not an option";;
    esac
    shift
done
#
count=1
for param in $@
do
    echo "Parameter #$count: $param"
    count=$[ $count + 1 ]
done
```

输入输出示例
```
/test17.sh -a -b test1 -d

Found the -a option
Found the -b option, with parameter value test1
-d is not an option

./test17.sh -b test1 -a -d

Found the -b option, with parameter value test1
Found the -a option
-d is not an option

./test17.sh -b test1 -a -d

Found the -b option, with parameter value test1
Found the -a option
-d is not an option

./test17.sh -ac           

-ac is not an option
```

例18 使用指令`getopt`来抽取命令行可选项及其值

脚本`test18.sh`
```
#!/bin/bash
# 使用指令`getopt`来抽取命令行可选项及其值
#
set -- $(getopt -q ab:cd "$@")
#
echo
while [ -n "$1" ]
do
    case "$1" in
    -a) echo "Found the -a option";;
    -b) param="$2"
        echo "Found the -b option, with parameter value $param"
        shift;;
    -c) echo "Found the -c option";;
    --) shift
        break;;
     *) echo "$1 is not an option";;
    esac
    shift
done
#
count=1
for param in "$@"
do
    echo "Parameter #$count: $param"
    count=$[ $count + 1 ]
done
```

输入输出示例：
```
[root@VM_0_16_centos test]# ./test18.sh -ac

Found the -a option
Found the -c option
[root@VM_0_16_centos test]# ./test18.sh -a -b test1 -cd test2 test3 test4

Found the -a option
Found the -b option, with parameter value 'test1'
Found the -c option
-d is not an option
Parameter #1: 'test2'
Parameter #2: 'test3'
Parameter #3: 'test4'
[root@VM_0_16_centos test]# ./test18.sh -a -b test1 -cd "test2 test3" test4

Found the -a option
Found the -b option, with parameter value 'test1'
Found the -c option
-d is not an option
Parameter #1: 'test2
Parameter #2: test3'
Parameter #3: 'test4'
```











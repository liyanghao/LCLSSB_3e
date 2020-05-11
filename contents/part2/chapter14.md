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












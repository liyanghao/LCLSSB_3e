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



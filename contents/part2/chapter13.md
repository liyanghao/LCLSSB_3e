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

### 例1 读取`list`中的值
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

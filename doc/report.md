# 一款由C到LLVM的编译器

### 王世杰 沈冠霖 陈语凝

石墨文档链接：(https://shimo.im/docs/WkXRQHRhRRxHdWyP/)

## 一、使用说明

### 1. 环境配置

程序语言：python 3.7.4

安装[antlr4](https://www.antlr.org/)；
安装antlr4-python3-runtime、llvmlite；

```
pip install antlr4-python3-runtime
pip install llvmlite
```

### 2.运行说明

1.在src目录下命令行输入 ```python QuickTest.py``` 测试全部五个程序样例；
2.也可以运行 ```python main.py [filename]```

[filename]列表如下：
```
test/palindrome.c
test/kmp.c
test/calc.c
test/quickSort.c
test/
```

## 二、实现方法与重难点简述

### 1.变量，结构体，函数的管理

**1.1 符号表的实现**

我们实现了SymbolTable类，也就是符号表类，用来管理变量（包括单一变量，数组，结构体变量）。

变量作用域是一个类似栈的结构------内层能访问外层变量，外层不能访问内层，一层结束后，其变量都没有意义了。因此我实现的符号表也是这种结构。

存储方式：一个数组，每个元素代表一层。数组每个元素是字典，其key是变量在C语言的变量名，value是变量在LLVM的类型，名称等，每个key-value键值对代表一个变量。

变量的各种操作：首先，进入和退出作用域（函数，分支，循环等）在符号表里体现为入栈和出栈---进入作用域，在数组后面append一个字典，代表新的一层的变量存储位置；退出作用域，删除数组最后一个元素，代表当前作用域的局部变量失效。

其次，在作用域内新增变量，则只需要访问数组最后一个字典元素，也就是当前局部变量。在这个字典里遍历key来判断是否重定义，如果没有重定义就新建一个键值对。

之后，查找变量的方法是由内到外，也就是数组由后到前访问。如果在内层找到，就不去外层找了，这就实现了变量的覆盖。如果找不到，就进行对应的异常处理。

最后，因为LLVM对于全局和局部变量处理策略不同，因此我们也要判断变量是全局还是局部。判断方法很简单：如果当前数组只有一个元素，代表当前在全局位置，否则是局部位置。

**1.2 函数和结构体的管理**

结构体我实现了Structure类。结构体整体是一个字典，每个key-value对代表一个结构体。key是结构体在C的名称，value里存储了其变量名和类型，暂时只支持结构体里面的变量是其他结构体或者单一变量，没有支持数组。读取结构体变量的时候，就直接遍历结构体的变量名数组进行匹配，提取对应的类型和顺序即可。

函数则是直接用一个字典存储。

通过遍历字典，可以很方便的进行结构体，函数的重定义和未定义错误处理。

**1.3 变量，数组，结构体的LLVM实现**

```python
LLVMName = ir.GlobalVariable(Module, Type, name = CName)
LLVMName = Builder.alloca(Type, name = CName)
```

全局，局部变量在LLVM里分别用以上两种方法实现。其中LLVMName代表其在LLVM中的名称，Cname代表其在C中名称，Type是类型。如果是数组，结构体，也一样，只是类型有所不同。结构体变量类型依赖结构体名称，变量名称和类型，数组变量类型依赖数组类型和长度。



### 2. 函数

**2.1 函数定义**

函数包括函数定义，参数，代码块三大部分。

定义函数需要以下语句

```
LLVMFunctionType = ir.FunctionType(ReturnType, ParameterTypeList)
LLVMFunction = ir.Function(Module, LLVMFunctionType, name = CFunctionName)
```

也就是，函数类型由其返回值和变量数目和类型决定; 函数由其C语言命名和类型定义;

函数参数遍历获取即可，但是要注意，函数参数存储的时候需要符号表进一层，因为函数参数和函数内直接定义的局部变量是等价的。

代码块较为容易解决，和其他的代码块一样。

**2.2 函数调用**

函数调用使用以下语句

```
ReturnVariable = Builder.call(LLVMFunction, ParameterList)
```

也就是先读取LLVM函数本身和其参数列表，然后返回值相当于一个当前位置局部变量。

我们还实现了调用printf，scanf等库函数，调用方法和调用自己的函数大致一致。



### 3. 程序结构

**3.1 选择结构**

选择结构支持if-else if-else 语句，此处生成LLVM IR的思路和汇编中跳转的思路类似，通过创建不同的代码块，跳转或条件跳转到不同的label处。

**3.2 循环结构**

循环结构支持for循环和while循环。

对于for循环，其基本语法是`for(init; condition ; step)`。其中init初始化语句可以为空，也可以是多条用`,`分割的语句。其逻辑顺序为，在循环开始前先执行init语句，然后判定condition，若满足则执行循环的主题body，随后step，一次循环后再次判定condition，进行下一次循环。

对于while循环，基本语法为`while(condition)`，先判断condition，如果condition为真则执行body，执行完成后再次跳转到condition判断，进行下一次循环，直到不满足condition跳出循环语句。


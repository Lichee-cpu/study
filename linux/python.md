[TOC]



## Python 应用

- Youtube - 视频社交网站
- Reddit - 社交分享网站
- Dropbox - 文件分享服务
- 豆瓣网 - 图书、唱片、电影等文化产品的资料数据库网站
- 知乎 - 一个问答网站
- 果壳 - 一个泛科技主题网站
- Bottle - Python微Web框架
- EVE - 网络游戏EVE大量使用Python进行开发
- Blender - 使用Python作为建模工具与GUI语言的开源3D绘图软件
- Inkscape - 一个开源的SVG矢量图形编辑器。

## 基础用法

### 注释

> 单行:  #
>
> 多行：‘’‘或“”“

### 导入模块

> 将整个模块(somemodule)导入，格式为： **import somemodule**
>
> 从某个模块中导入某个函数,格式为： **from somemodule import somefunction**

### 运算符

#### 算术运算符

a=10,b=21

| 运算符 | 描述                                            | 实例                 |
| ------ | ----------------------------------------------- | -------------------- |
| `+`    | 加 - 两个对象相加                               | `a + b` 输出结果 31  |
| `-`    | 减 - 得到负数或是一个数减去另一个数             | `a - b` 输出结果 -11 |
| `*`    | 乘 - 两个数相乘或是返回一个被重复若干次的字符串 | `a * b` 输出结果 210 |
| `/`    | 除 - x 除以 y                                   | `b / a` 输出结果 2.1 |
| `%`    | 取模 - 返回除法的余数                           | `b % a` 输出结果 1   |
| `**`   | 幂 - 返回x的y次幂                               | `a**b` 为10的21次方  |
| `//`   | 取整除 - 向下取接近除数的整数                   | `9//2` `-9//2`       |

#### 比较运算符

| 运算符 | 描述                                                         | 实例                   |
| ------ | ------------------------------------------------------------ | ---------------------- |
| `==`   | 等于 - 比较对象是否相等                                      | `(a == b)`返回 False。 |
| `!=`   | 不等于 - 比较两个对象是否不相等                              | `(a != b)` 返回 True。 |
| `>`    | 大于 - 返回x是否大于y                                        | `(a > b)` 返回 False。 |
| `<`    | 小于 - 返回x是否小于y。所有比较运算符返回1表示真，返回0表示假。这分别与特殊的变量True和False等价。注意，这些变量名的大写。 | `(a < b)`返回 True。   |
| `>=`   | 大于等于 - 返回x是否大于等于y。                              | `(a >= b)`返回 False。 |
| `<=`   | 小于等于 - 返回x是否小于等于y。                              | `(a <= b)`返回 True。  |

#### 位运算符

| 运算符 | 描述                                                         | 实例                                                         |
| ------ | ------------------------------------------------------------ | ------------------------------------------------------------ |
| `&`    | 按位与运算符：参与运算的两个值,如果两个相应位都为1,则该位的结果为1,否则为0 | `(a & b)`输出结果 12 ，二进制解释： 0000 1100                |
| `|`    | 按位或运算符：只要对应的二个二进位有一个为1时，结果位就为1。 | `(a \| b)`输出结果 61 ，二进制解释： 0011 1101               |
| `^`    | 按位异或运算符：当两对应的二进位相异时，结果为1              | `(a ^ b)` 输出结果 49 ，二进制解释： 0011 0001               |
| `~`    | 按位取反运算符：对数据的每个二进制位取反,即把1变为0,把0变为1。**~x** 类似于 **-x-1** | `(~a )` 输出结果 -61 ，二进制解释： 1100 0011， 在一个有符号二进制数的补码形式。 |
| `<<`   | 左移动运算符：运算数的各二进位全部左移若干位，由"<<"右边的数指定移动的位数，高位丢弃，低位补0。 | `a << 2` 输出结果 240 ，二进制解释： 1111 0000               |
| `>>`   | 右移动运算符：把">>"左边的运算数的各二进位全部右移若干位，">>"右边的数指定移动的位数 | `a >> 2` 输出结果 15 ，二进制解释： 0000 1111                |

#### 逻辑运算符

| 运算符 | 逻辑表达式 | 描述                                                         | 实例                      |
| ------ | ---------- | ------------------------------------------------------------ | ------------------------- |
| `and`  | x and y    | 布尔"与" 如果`x`为 False，`x and y` 返回 False，否则它返回 y 的计算值。 | `(a and b)` 返回 20。     |
| `or`   | x or y     | 布尔"或" 如果 `x` 是 True，它返回`x`的值，否则它返回`y`的计算值。 | `(a or b)`返回 10。       |
| `not`  | not x      | 布尔"非" 如果 `x` 为 True，返回 False 。如果`x` 为 False，它返回 True。 | `not(a and b)` 返回 False |

#### 成员运算符

| 运算符   | 描述                                                    | 解析                                              |
| -------- | ------------------------------------------------------- | ------------------------------------------------- |
| `in`     | 如果在指定的序列中找到值返回 True，否则返回 False。     | x 在 y 序列中 , 如果 x 在 y 序列中返回 True。     |
| `not in` | 如果在指定的序列中没有找到值返回 True，否则返回 False。 | x 不在 y 序列中 , 如果 x 不在 y 序列中返回 True。 |

#### 身份运算符

| 运算符   | 描述                                        | 实例                                                         |
| -------- | ------------------------------------------- | ------------------------------------------------------------ |
| `is`     | is 是判断两个标识符是不是引用自一个对象     | `x is y`, 类似`id(x) == id(y)`, 如果引用的是同一个对象则返回 True，否则返回 False，==是判断值是否相等 |
| `is not` | is not 是判断两个标识符是不是引用自不同对象 | `x is not y` ， 类似 `id(a) != id(b)`。如果引用的不是同一个对象则返回结果 True，否则返回 False。 |



## 数据类型

#### Number（数字）

- ##### **整型(Int)**

  是正或负整数，不带小数点

- ##### **浮点型(float)**

  由整数部分与小数部分组成

- ##### **复数( (complex))** 

  用a + bj,或者complex(a,b)表示

##### 数字类型转换

>- `int(x)` 将x转换为一个整数。
>- `float(x)`将x转换到一个浮点数。
>- `complex(x)` 将x转换到一个复数，实数部分为 x，虚数部分为 0。
>- `complex(x, y)` 将 x 和 y 转换到一个复数，实数部分为 x，虚数部分为 y。x 和 y 是数字表达式。

##### 常用函数

| 函数              | 返回值 ( 描述 )                                              |
| ----------------- | ------------------------------------------------------------ |
| `abs(x)`          | 绝对值                                                       |
| `ceil(x)`         | 返回数字的上入整数，如`math.ceil(4.1)` 返回 5                |
| `floor(x)`        | 返回数字的下舍整数，如math.floor(4.9)返回 4                  |
| `max(x1, x2,...)` | 返回给定参数的最大值，参数可以为序列。                       |
| `min(x1, x2,...)` | 返回给定参数的最小值，参数可以为序列。                       |
| `modf(x)`         | 返回x的整数部分与小数部分，两部分的数值符号与x相同，整数部分以浮点型表示。 |
| `pow(x, y)`       | x**y 运算后的值。                                            |
| `round(x [,n])`   | 返回浮点数 x 的四舍五入值，如给出 n 值，则代表舍入到小数点后的位数。**其实准确的说是保留值将保留到离上一位更近的一端。** |
| `sqrt(x)`         | 返回数字x的平方根。                                          |

#### String（字符串）

字符串形式：

>‘文字’
>
>“文字”
>
>‘’‘文字可换行’‘’

操作：

>```
># 字符串截取  [起始位置，结束位置)
>![images20210427162533](https://github.com/Lichee-cpu/images/raw/master/images/images20210427162533.png)
>```

##### 字符串转义

| 转义字符   | 描述                                                         |
| ---------- | ------------------------------------------------------------ |
| (在行尾时) | 续行符                                                       |
| \          | 反斜杠符号                                                   |
| \'         | 单引号                                                       |
| \"         | 双引号                                                       |
| \a         | 响铃                                                         |
| \b         | 退格(Backspace)                                              |
| \000       | 空                                                           |
| \n         | 换行                                                         |
| \v         | 纵向制表符                                                   |
| \t         | 横向制表符                                                   |
| \r         | 回车                                                         |
| \f         | 换页                                                         |
| \oyy       | 八进制数，**yy** 代表的字符，例如：**\o12** 代表换行，其中 o 是字母，不是数字 0。 |
| \xyy       | 十六进制数，yy代表的字符，例如：\x0a代表换行                 |
| \other     | 其它的字符以普通格式输出                                     |

##### 字符串格式化

| 符 号 | 描述                                 |
| ----- | ------------------------------------ |
| %c    | 格式化字符及其ASCII码                |
| %s    | 格式化字符串                         |
| %d    | 格式化整数                           |
| %u    | 格式化无符号整型                     |
| %o    | 格式化无符号八进制数                 |
| %x    | 格式化无符号十六进制数               |
| %X    | 格式化无符号十六进制数（大写）       |
| %f    | 格式化浮点数字，可指定小数点后的精度 |
| %e    | 用科学计数法格式化浮点数             |
| %E    | 作用同%e，用科学计数法格式化浮点数   |
| %g    | %f和%e的简写                         |
| %G    | %f 和 %E 的简写                      |
| %p    | 用十六进制数格式化变量的地址         |

~~~python
age = 8
name = '小胖'
print("我叫%s,今年%d岁!" % (name, age))

>>>我叫小胖,今年8岁!
~~~



#### List（列表）

格式：list1= [ ]

操作

>~~~
># 下标索引访问与切片访问列表对象
>>>>list1 = ['Google', 'Python', 1997, 2000];
>>>>list2 = [1, 2, 3, 4, 5, 6, 7 ];
>>>>print("list1[0]: ", list1[0])
>list1[0]:  Google
>>>>print("list2[1:5]: ", list2[1:5])
>list2[1:5]:  [2, 3, 4, 5]
>~~~
>
>~~~
># 添加元素
>>>> list1 = ['hello', 'ma', 'ka', 'ba', 'ka']
>>>> list1.append('ye')
>>>> list1
>['hello', 'ma', 'ka', 'ba', 'ka', 'ye']
>~~~
>
>~~~
># 更新（替换）元素
>>>> list = ['Google', 'Python', 1997, 2000]
>>>> list[2] = 2001
>>>> list
>['Google', 'Python', 2001, 2000]
>~~~
>
>~~~
># 删除元素
>>>> list = ['Google', 'Python', 1997, 2000]
>>>> del list[2]
>>>> list
>['Google', 'Python', 2000]
>~~~

##### 脚本操作符

| Python 表达式                           | 结果                         | 描述                 |
| --------------------------------------- | ---------------------------- | -------------------- |
| `len([1, 2, 3])`                        | 3                            | 长度                 |
| `[1, 2, 3] + [4, 5, 6]`                 | [1, 2, 3, 4, 5, 6]           | 组合                 |
| `['Hi!'] * 4`                           | ['Hi!', 'Hi!', 'Hi!', 'Hi!'] | 重复                 |
| `3 in [1, 2, 3]`                        | True                         | 元素是否存在于列表中 |
| `for x in [1, 2, 3]: print(x, end=" ")` | 1 2 3                        | 迭代                 |

#### Tuple（元组）

元组与列表类似，不同之处在于元组的元素不能修改。

#### Set（集合）

格式：可以使用大括号 `{ }` 或者 `set()` 函数创建集合

创建一个空集合必须用`set()`而不是 `{}`，因为 `{}` 是用来创建一个空字典。

##### 集合运算

> ~~~
> >>>a = set('abracadabra')
> >>>b = set('alacazam')
> >>>print(a)                
> {'r', 'd', 'a', 'b', 'c'}
> >>>print(a - b)                               # 集合a中包含而集合b中不包含的元素
> {'d', 'r', 'b'}
> >>>print(a | b)                               # 集合a或b中包含的所有元素
> {'l', 'r', 'd', 'z', 'a', 'b', 'c', 'm'}
> >>>print(a & b)                               # 集合a和b中都包含了的元素
> {'a', 'c'}
> >>>print(a ^ b)                               # 不同时包含于a和b的元素
> {'d', 'l', 'z', 'b', 'r', 'm'}
> ~~~

操作

> ~~~
> 
> ~~~
>
> 

| 方法                    | 描述                                               |
| ----------------------- | -------------------------------------------------- |
| `add()`                 | 为集合添加元素                                     |
| `remove()`              | 元素  从集合中移除,没有就报错，不报错就用discard() |
| `clear()`               | 移除集合中的所有元素                               |
| `copy()`                | 拷贝一个集合                                       |
| `difference()`          | 返回多个集合的差集                                 |
| `difference_update()`   | 移除集合中的元素，该元素在指定的集合也存在。       |
| `discard()`             | 删除集合中指定的元素                               |
| `intersection()`        | 返回集合的交集                                     |
| `intersection_update()` | 返回集合的交集。                                   |

#### Dictionary（字典）

格式：d = {key1 : value1, key2 : value2 }

操作

>~~~
># 访问字典对象
>>>>dict = {'Name': 'Python', 'Age': 30, 'Class': 'First'}
>
>>>>print("dict['Name']: ", dict['Name'])
>dict['Name']:  Python
>>>>print("dict['Age']: ", dict['Age'])
>dict['Age']:  30
>~~~
>
>~~~
># 更新对象值
>>>> dict1 = {'Name': 'Python', 'Age': 30, 'Class': 'First'}
>>>> dict1["Age"]=55
>>>> dict1
>{'Name': 'Python', 'Age': 55, 'Class': 'First'}
>~~~
>
>~~~
># 删除字典对象
>>>> dict1 = {'Name': 'Python', 'Age': 7, 'Class': 'First'}
>>>> del dict1['Name']
>>>> dict1
>{'Age': 7, 'Class': 'First'}
>~~~

##### 内置方法

| 序号 | 函数及描述                                                   | 实例                                                         |
| ---- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1    | `len(dict)`计算字典元素个数，即键的总数。                    | `dict = {'Name': 'Python', 'Age': 22, 'Class': 'First'};len(dict)` |
| 2    | `str(dict)`输出字典，以可打印的字符串表示。                  | `dict = {'Name': 'Python', 'Age': 22, 'Class': 'First'} ;str(dict)` |
| 3    | `type(variable)`返回输入的变量类型，如果变量是字典就返回字典类型。 | `type({})`                                                   |

## 数据结构

Python中列表是可变的，这是它区别于字符串和元组的最重要的特点，一句话概括即：列表可以修改，而字符串和元组不能。

以下是 Python 中列表的方法：

| 方法                | 描述                                                         |
| ------------------- | ------------------------------------------------------------ |
| `list.append(x)`    | 把一个元素添加到列表的结尾，相当于`a[len(a):] = [x]`。       |
| `list.extend(L)`    | 通过添加指定列表的所有元素来扩充列表，相当于`a[len(a):] = L`。 |
| `list.insert(i, x)` | 在指定位置插入一个元素。第一个参数是准备插入到其前面的那个元素的索引，例如 a.insert(0, x) 会插入到整个列表之前，而 `a.insert(len(a), x)`相当于`a.append(x)`。 |
| `list.remove(x)`    | 删除列表中值为 x 的第一个元素。如果没有这样的元素，就会返回一个错误。 |
| `list.pop([i])`     | 从列表的指定位置移除元素，并将其返回。如果没有指定索引，a.pop()返回最后一个元素。元素随即从列表中被移除。（方法中 i 两边的方括号表示这个参数是可选的，而不是要求你输入一对方括号，你会经常在 Python 库参考手册中遇到这样的标记。） |
| `list.clear()`      | 移除列表中的所有项，等于`del a[:]`。                         |
| `list.index(x)`     | 返回列表中第一个值为 x 的元素的索引。如果没有匹配的元素就会返回一个错误。 |
| `list.count(x)`     | 返回 x 在列表中出现的次数。                                  |
| `list.sort()`       | 对列表中的元素进行排序。                                     |
| `list.reverse()`    | 倒排列表中的元素。                                           |
| `list.copy()`       | 返回列表的浅复制，等于`a[:]`。                               |

操作

>~~~
># 列表当做堆栈使用 后进先出
>a = [66.25, 333, 333, 1, 1234.5]
>print(a.count(333), a.count(66.25), a.count('x'))
>a.insert(2, -1)
>a.append(333)
>print(a)
>
>print('index:',a.index(333))
>
>a.remove(333)
>print('remove:',a)
>
>a.reverse()
>print('reverse:',a)
>
>a.sort()
>print('sort:',a)
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427170559.png)
>~~~
>
>~~~
># 列表当作队列使用
>from collections import deque
>queue1 = deque(["Joe", "John", "Jack"])
>queue1.append("Terry")           # Terry arrives
>queue1.append("Graham")          # Graham arrives
>print(queue1.popleft())                 # The first to arrive now leaves
>print(queue1.popleft())   
>print(queue1)                          # Remaining queue in order of arrival
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427170704.png)
>~~~
>
>~~~
># 列表推导式
>>>>vec = [2, 4, 6]
>>>>[3*x for x in vec]
>[6, 12, 18]
>>>> [3*x for x in vec if x < 2]
>[]
>>>> [3*x for x in vec if x < 3]
>[6]
>>>> 
>~~~

##### 循环

```
break 跳出循环
continue 跳过本次循环
```

##### 迭代器与生成器

> 迭代器是一个可以记住遍历的位置的对象。
>
> 迭代器对象从集合的第一个元素开始访问，直到所有的元素被访问完结束。迭代器只能往前不会后退。
>
> 迭代器有两个基本的方法：`iter()`和 `next()`。

## 函数

格式：def  函数名(参数):

参数

> 必须参数 def printme( str ):
>
> 关键字参数  def printme( str ):   调用时printme( str = "动手学Python")
>
> 默认参数  def printinfo( name, age = 35 ):
>
> 不定长参数  def printinfo( arg1, *vartuple ):

### 匿名函数

python 使用lambda 来创建匿名函数。

所谓匿名，意即不再使用 def 语句这样标准的形式定义一个函数。

- lambda 只是一个表达式，函数体比 def 简单很多。
- lambda的主体是一个表达式，而不是一个代码块。仅仅能在lambda表达式中封装有限的逻辑进去。
- lambda 函数拥有自己的命名空间，且不能访问自己参数列表之外或全局命名空间里的参数。
- 虽然lambda函数看起来只能写一行，却不等同于C或C++的内联函数，后者的目的是调用小函数时不占用栈内存从而增加运行效率。

> ~~~
> >>> sum = lambda arg1, arg2: arg1 + arg2
> >>> print("相加后的值为 : ", sum( 10, 20 ))
> 相加后的值为 :  30
> ~~~

### return

**return [表达式]** 语句用于退出函数，选择性地向调用方返回一个表达式。

注意：不写任何返回值的return语句返回一个`NoneType`类型的`None`对象。之前的例子都没有示范如何返回数值

### 异常处理

<img src="https://www.freeaihub.com/python/images/try_except.png" alt="img" style="zoom: 33%;" />
<img src="https://www.freeaihub.com/python/images/try_except_else.png" alt="img" style="zoom: 33%;" />
<img src="https://www.freeaihub.com/python/images/try_except_else_finally.png" alt="img" style="zoom: 33%;" />
<img src="https://www.freeaihub.com/python/images/raise.png" alt="img" style="zoom: 33%;" />





## 面向对象

#### 类的构造方法`__init__()`

~~~
class Complex:
    def __init__(self, realpart, imagpart):
        self.r = realpart
        self.i = imagpart
x = Complex(3.0, -4.5)
print(x.r, x.i)   # 输出结果：3.0 -4.5
~~~

类的方法

~~~
#类定义
class people:
    #定义基本属性
    name = ''
    age = 0
    #定义私有属性,私有属性在类外部无法直接进行访问
    __weight = 0
    #定义构造方法
    def __init__(self,n,a,w):
        self.name = n
        self.age = a
        self.__weight = w
    def speak(self):
        print("%s 说: 我 %d 岁。%d" %(self.name,self.age,self.__weight))

# 实例化类
p = people('Python',10,30)
p.speak()
~~~
<img src="https://github.com/Lichee-cpu/images/raw/master/images/images20210427175523.png" style="zoom:80%;" />
<img src="C:\Users\那年\AppData\Roaming\Typora\typora-user-images\image-20210427175622041.png" alt="image-20210427175622041" style="zoom:80%;" />

### 类的专有方法

>**init :** 构造函数，在生成对象时调用
>**del :** 析构函数，释放对象时使用
>**repr :** 打印，转换
>**setitem :** 按照索引赋值
>**getitem:** 按照索引获取值
>**len:** 获得长度
>**cmp:** 比较运算
>**call:** 函数调用
>**add:** 加运算
>**sub:** 减运算
>**mul:** 乘运算
>**truediv:** 除运算
>**mod:** 求余运算
>**pow:** 乘方

### 运算符重载

~~~
class Vector:
   def __init__(self, a, b):
      self.a = a
      self.b = b

   def __str__(self):
      return 'Vector (%d, %d)' % (self.a, self.b)

   def __add__(self,other):
      return Vector(self.a + other.a, self.b + other.b)

v1 = Vector(2,10)
v2 = Vector(5,-2)
print(v1 + v2)
~~~

~~~
输出：Vector (7, 8)
~~~

## 命名空间与作用域

.<img src="https://www.freeaihub.com/python/images/types_namespace-1.png" alt="img" style="zoom:50%;" />

查找顺序为：**局部的命名空间去 -> 全局命名空间 -> 内置命名空间**。![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427181639.png))

### 四种作用域：

> - **L（Local）**：最内层，包含局部变量，比如一个函数/方法内部。
> - **E（Enclosing）**：包含了非局部(non-local)也非全局(non-global)的变量。比如两个嵌套函数，一个函数（或类） A 里面又包含了一个函数 B ，那么对于 B 中的名称来说 A 中的作用域就为 nonlocal。
> - **G（Global）**：当前脚本的最外层，比如当前模块的全局变量。
> - **B（Built-in）**： 包含了内建的变量/关键字等。，最后被搜索
>
> 规则顺序： **L –> E –> G –>gt; B**。

#### LEGB作用域练习

#### ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427181612.png)

### `global`和`nonlocal`关键字

### ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427181502.png)![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427181749.png)



## 标准库

### 操作系统接口 os

### 文件通配符 glob

### 命令行参数 sys

### 字符串正则匹配 re

### 数学 math、random

### 日期和时间 from datetime import date

### 数据压缩 zlib

### 性能度量 from timeit import Timer

### 测试模块 doctest


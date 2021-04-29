[TOC]



## 安装R

下载地址 https://cran.r-project.org/mirrors.html

1.选择中国区

>![image-20210427230108736](C:\Users\那年\AppData\Roaming\Typora\typora-user-images\image-20210427230108736.png)

2.选择对应的系统

>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427230204.png)

3.选择二进制文件

>![image-20210427230241435](C:\Users\那年\AppData\Roaming\Typora\typora-user-images\image-20210427230241435.png)

4.点击下载

>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427230504.png)
>
>

5.下载完成双击安装（直接下一步进行到底）

> 安装完成生成这两个图标![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427230920.png)

6.常用默认设置
![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427231718.png)



## R集成开发环境

下载地址： https://www.rstudio.com/products/rstudio/download/

一样直接下一步到底完成安装

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427234802.png)

设置工作目录
![](https://github.com/Lichee-cpu/images/raw/master/images/images20210427235953.png)



## R基础

### 赋值

使用<-或者=

ctrl+ L  清理屏幕

### 包的安装

#### 1.在线安装：自动解决依赖

先设置源
![](https://github.com/Lichee-cpu/images/raw/master/images/images20210428000848.png)

安装包命令
> install.packages("包名")
>
> ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210428001031.png)



![](https://github.com/Lichee-cpu/images/raw/master/images/images20210428002217.png) 

~~~R
# 赋值与传值
myString <- "使用<-赋值"
myString2 = "使用=传值"

print(myString)
print(myString2)


# 基础运算
print(10%/%3) #整除
print(10%%3) #整除取余
# 1 到 10 的向量
v <- 1:10
print(v)

# 判断数字是否在向量 v 中
v1 <- 3
v2 <- 15
print(v1 %in% v)
print(v2 %in% v)

# 矩阵与它转置的矩阵相乘
M = matrix( c(2,6,5,1,10,4), nrow = 2,ncol = 3,byrow = TRUE)
t = M %*% t(M)
print(t)

~~~

## 数据类型

### 基本类型：数字、逻辑、文本

### 对象类型

#### 向量Vectors

使用c()来创造一个向量

>#向量的取值
>
>~~~
>> a = c(10, 20, 30, 40, 50)
>> a[1:4] # 取出第 1 到 4 项，包含第 1 和第 4 项
>[1] 10 20 30 40
>> a[c(-1, -5)] # 去掉第 1 和第 5 项
>[1] 20 30 40
>~~~
>
>#向量的计算
>
>~~~
>> c(1.1, 1.2, 1.3) + 6
>[1] 7.1 7.2 7.3
>> a = c(1, 3, 5, 2, 4, 6)
>> sort(a)  # 排序
>[1] 1 2 3 4 5 6
>> rev(a)  # 反转
>[1] 6 4 2 5 3 1
>> order(a) # 排序的索引
>[1] 1 4 2 5 3 6
>> a[order(a)] # 根据排序索引列出
>[1] 1 2 3 4 5 6
>~~~
>
>#向量的统计
>
>| **函数名** | **含义**     |**用例**  |
>| :--------- | :------------------------|----------------|
>| sum        | 求和              | sum(1:5)                   |
>| mean       | 求平均值      |mean(1:9)                       |
>| var        | 方差                  |  |
>| sd         | 标准差            ||
>| min        | 最小值                 ||
>| max        | 最大值           ||
>| range      | 取值范围（二维向量，最大值和最小值） ||
>
>#向量生成
>
>~~~
># 生成1到9步长为2
>> seq(1, 9, 2)
>[1] 1 3 5 7 9
>~~~
>
>#字符串
>
>~~~
>> toupper("Runoob") # 转换为大写
>[1] "RUNOOB"
>> tolower("Runoob") # 转换为小写
>[1] "runoob"
>> nchar("中文", type="bytes") # 统计字节长度
>[1] 4
>> nchar("中文", type="char") # 总计字符数量
>[1] 2
>> substr("123456789", 1, 5) # 截取字符串，从 1 到 5
>[1] "12345"
>> substring("1234567890", 5) # 截取字符串，从 5 到结束
>[1] "567890"
>> as.numeric("12") # 将字符串转换为数字
>[1] 12
>> as.character(12.34) # 将数字转换为字符串
>[1] "12.34"
>> strsplit("2019;10;1", ";") # 分隔符拆分字符串
>[[1]]
>[1] "2019" "10"   "1"
>> gsub("/", "-", "2019/10/1") # 替换字符串
>[1] "2019-10-1"
>~~~
>
>

#### 列表list

使用 **list()**创建列表，列表可以包含数字、字符串、向量、另一个列表、矩阵、函数等

>#**names()**函数给列表的元素命名
>
>~~~
># 列表包含向量、矩阵、列表
>list_data <- list(c("Google","Runoob","Taobao"), matrix(c(1,2,3,4,5,6), nrow = 2),
>                  list("runoob",12.3))
>
># 给列表元素设置名字
>names(list_data) <- c("Sites", "Numbers", "Lists")
>
># 显示列表
>print(list_data)
>~~~
>
>~~~
>输出结果：
>$Sites
>[1] "Google" "Runoob" "Taobao"
>
>$Numbers
>     [,1] [,2] [,3]
>[1,]    1    3    5
>[2,]    2    4    6
>
>$Lists
>$Lists[[1]]
>[1] "runoob"
>
>$Lists[[2]]
>[1] 12.3
>~~~



>#如果使用来 **names()** 函数命名后，我们还可以使用对应名字来访问
>
>~~~
># 列表包含向量、矩阵、列表
>> list_data <- list(c("Google","Runoob","Taobao"), matrix(c(1,2,3,4,5,6), nrow = 2),
>+                   list("runoob",12.3))
>
># 给列表元素设置名字
>> names(list_data) <- c("Sites", "Numbers", "Lists")
>
># 显示列表
>> print(list_data[1])
>$Sites
>[1] "Google" "Runoob" "Taobao"
>
># 访问列表的第三个元素
>> print(list_data[3])
>$Lists
>$Lists[[1]]
>[1] "runoob"
>
>$Lists[[2]]
>[1] 12.3
>
>
># 访问第一个向量元素
>> print(list_data$Numbers)
>     [,1] [,2] [,3]
>[1,]    1    3    5
>[2,]    2    4    6
>~~~



>#添加、删除、更新的操作
>
>~~~
>> # 列表包含向量、矩阵、列表
>> list_data <- list(c("Google","Runoob","Taobao"), matrix(c(1,2,3,4,5,6), nrow = 2),
>+                   list("runoob",12.3))
>> 
>> # 给列表元素设置名字
>> names(list_data) <- c("Sites", "Numbers", "Lists")
>> # 添加元素
>> list_data[4] <- "新元素"
>> print(list_data[4])
>[[1]]
>[1] "新元素"
>
>> # 删除元素
>> list_data[4] <- NULL
>> 
>> # 删除后输出为 NULL
>> print(list_data[4])
>$<NA>
>NULL
>
>> # 更新元素
>> list_data[3] <- "我替换来第三个元素"
>> print(list_data[3])
>$Lists
>[1] "我替换来第三个元素"
>~~~



>#合并列表
>
>~~~
>> # 创建两个列表
>> list1 <- list(1,2,3)
>> list2 <- list("Google","Runoob","Taobao")
>> # 合并列表
>> merged.list <- c(list1,list2)
>> # 显示合并后的列表
>> print(merged.list)
>[[1]]
>[1] 1
>
>[[2]]
>[1] 2
>
>[[3]]
>[1] 3
>
>[[4]]
>[1] "Google"
>
>[[5]]
>[1] "Runoob"
>
>[[6]]
>[1] "Taobao"
>
>~~~



>#列表转换为向量，**unlist()** 函数，将列表转换为向量
>
>~~~
>> # 创建列表
>> list1 <- list(1:5)
>> print(list1)
>[[1]]
>[1] 1 2 3 4 5
>
>> list2 <-list(10:14)
>> print(list2)
>[[1]]
>[1] 10 11 12 13 14
>
>> # 转换为向量
>> v1 <- unlist(list1)
>> v2 <- unlist(list2)
>> print(v1)
>[1] 1 2 3 4 5
>> print(v2)
>[1] 10 11 12 13 14
>> # 两个向量相加
>> result <- v1+v2
>> print(result)
>[1] 11 13 15 17 19
>~~~

#### 矩阵matrix

语法格式：matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,dimnames = NULL)

>- **data** 向量，矩阵的数据
>- **nrow** 行数
>- **ncol** 列数
>- **byrow** 逻辑值，为 FALSE 按列排列，为 TRUE 按行排列
>- **dimname** 设置行和列的名称

> ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429093404.png)

> ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429093442.png)

>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429093541.png)

>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429093604.png)

#### 数组array
<img src="https://www.runoob.com/wp-content/uploads/2020/07/2039-08-06Done.png" alt="img" style="zoom:33%;" />

array() 函数语法格式如下：

```
array(data = NA, dim = length(data), dimnames = NULL)
```

- data 向量，数组元素。
- dim 数组的维度，默认是一维数组。
- dimnames 维度的名称，必须是个列表，默认情况下是不设置名称的。

 例如 - 如果我们创建一个维度(2，3，4)的数组，则它创建4个矩形矩阵，每个矩阵具有2行和3列。 数组只能存储数据类型。

>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429094725.png)



>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429095015.png)



>![image-20210429095242798](C:\Users\那年\AppData\Roaming\Typora\typora-user-images\image-20210429095242798.png)

>语法:`apply(x, margin, fun)`
>
>以下是所使用的参数的说明 -
>
>- **x**是一个数组。
>- **margin**是所使用的数据集的名称。
>- **fun**是要应用于数组元素的函数。
>
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429095831.png)

#### 因子factor

因子是用于对数据进行分类并将其存储为级别的数据对象。 它们可以存储字符串和整数。 它们在具有有限数量的唯一值的列中很有用。 像“男性”，“女性”和True，False等。它们在统计建模的数据分析中很有用。
![](https://github.com/Lichee-cpu/images/raw/master/images/imagesimage-20210429100901277.png)![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429101214.png)

生成因子级别

语法：

```
gl(n, k, labels)
```

以下是所使用的参数的说明 -

- **n**是给出级数的整数。
- **k**是给出复制数目的整数。
- **labels**是所得因子水平的标签向量。

>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429101502.png)
![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429101855.png)

#### 数据框dataframe

数据框是 R 语言的数据结构，是特殊的二维列表。

数据框每一列都有一个唯一的列名，长度都是相等的，同一列的数据类型需要一致，不同列的数据类型可以不一样。

R 语言数据框使用 data.frame() 函数来创建，语法格式如下：

```
data.frame(…, row.names = NULL, check.rows = FALSE,
           check.names = TRUE, fix.empty.names = TRUE,
           stringsAsFactors = default.stringsAsFactors())
```

- **…**: 列向量，可以是任何类型（字符型、数值型、逻辑型），一般以 tag = value 的形式表示，也可以是 value。
- **row.names**: 行名，默认为 NULL，可以设置为单个数字、字符串或字符串和数字的向量。
- **check.rows**: 检测行的名称和长度是否一致。
- **check.names**: 检测数据框的变量名是否合法。
- **fix.empty.names**: 设置未命名的参数是否自动设置名字。
- **stringsAsFactors**: 布尔值，字符是否转换为因子，factory-fresh 的默认值是 TRUE，可以通过设置选项（stringsAsFactors=FALSE）来修改。

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429104550.png)

![image-20210429104611416](C:\Users\那年\AppData\Roaming\Typora\typora-user-images\image-20210429104611416.png)

>摘要
>
>~~~
>> table = data.frame(
>+     姓名 = c("张三", "李四"),
>+     工号 = c("001","002"),
>+     月薪 = c(1000, 2000)
>+     
>+ )
>> # 显示概要
>> print(summary(table)) 
>     姓名               工号                月薪     
> Length:2           Length:2           Min.   :1000  
> Class :character   Class :character   1st Qu.:1250  
> Mode  :character   Mode  :character   Median :1500  
>                                       Mean   :1500  
>                                       3rd Qu.:1750  
>                                       Max.   :2000  
>> 
>~~~

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429110522.png)

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429110725.png)

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429110844.png)

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429111020.png)

## 变量

变量命名：有效的变量名称由字母，数字和点或下划线字符组成。 变量名以字母或不以数字后跟的点开头。

| 变量名                 | 合法性 | 原因                                               |
| ---------------------- | ------ | -------------------------------------------------- |
| `var_name2.`           | 有效   | 有字母，数字，点和下划线                           |
| `VAR_NAME％`           | 无效   | 有字符'％'。只有点(.)和下划线允许的。              |
| `2var_name`            | 无效   | 以数字开头                                         |
| `.var_name`,`var.name` | 有效   | 可以用一个点(.)，但启动点(.)，不应该后跟一个数字。 |
| `.2var_name`           | 无效   | 起始点后面是数字使其无效。                         |
| `_var_name`            | 无效   | 开头_这是无效的                                    |

#### 变量赋值

>~~~
># Assignment using equal operator.
>var.1 = c(0,1,2,3)           
>
># Assignment using leftward operator.
>var.2 <- c("learn","R")   
>
># Assignment using rightward operator.   
>c(TRUE,1) -> var.3           
>
>print(var.1)
>~~~

#### 查看数据类型

>~~~
>var_x <- "Hello"
>cat(class(var_x))
>~~~

#### 查找变量

>`ls()`取决于在您的环境中声明的变量
>
>~~~
>ls()
>~~~

#### 删除变量

>使用`rm()`函数删除变量。 下面我们删除变量`var.3`。 打印时，抛出变量错误的值。
>
>~~~
>rm(var.3)
>print(var.3)
>~~~

## 函数

```
function_name <- function(arg_1, arg_2, ...) {
    // 函数体
}
```

- function_name : 为函数名
- arg_1, arg_2, ... : 形式参数列表

函数返回值使用 **return()**。

### 自定义函数

>~~~
># 定义一个函数，用于计数一个系列到平方值
>new.function <- function(a) {
>   for(i in 1:a) {
>      b <- i^2
>      print(b)
>   }
>}
>~~~

## 判断

| 声明              | 描述                                                         |
| ----------------- | ------------------------------------------------------------ |
| `if`语句          | `if`语句由一个布尔表达式后跟一个或多个语句组成。             |
| `if ... else`语句 | `if`语句后面可以有一个可选的`else`语句，当布尔表达式为false时执行。 |
| `switch`语句      | `switch`语句允许根据值列表测试变量的相等性。                 |

~~~
x <- c("what","is","truth")

if("Truth" %in% x) {
   print("Truth is found the first time")
} else if ("truth" %in% x) {
   print("truth is found the second time")
} else {
   print("No truth found")
}
~~~





## 包

### 检查包

~~~
# 获取包含R包的库位置
.libPaths()
# 获取已安装的所有软件包列表
library()
# 获取当前在R环境中加载的所有包
search()
~~~

报错：

> library()
> 错误: File C:\Users\那年\AppData\Local\Temp\RtmpcvHkJs\RlibraryIQR27bc6bb1556b does not exist
>
> https://ask.csdn.net/questions/1155463

### 安装包

~~~
install.packages("Package Name")
install.packages("XML")
~~~



## 文件读取与保存

### 读取CSV

>注意：csv文件最后一行是空行
>
>~~~
>data <- read.csv("sites.csv", encoding="UTF-8")
>print(data)
>~~~
>
>返回的是数据框
>
>~~~~
>> print(is.data.frame(data))
>[1] TRUE
>> print(ncol(data))
>[1] 4
>~~~~
>
>保存为csv
>
>~~~
>> data <- read.csv("sites.csv", encoding="UTF-8")
>> retval <- subset(data, likes == 222)
>> write.csv(retval,"runoob.csv")
>> newdata <- read.csv("runoob.csv")
>> print(newdata)
>  X id   name            url likes
>1 2  2 Runoob www.runoob.com   222
>~~~



### 读取Excel

>R 语言读写 Excel 文件需要安装扩展包.
>
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429134937.png)
>
>
>
>~~~
># 验证包
>> any(grepl("xlsx",installed.packages()))
>[1] TRUE
>> library("xlsx")
>> data <- read.xlsx("sites.xlsx", sheetIndex = 1)
>> print(data)
>  id   name            url likes
>1  1 Google www.google.com   111
>2  2 Runoob www.runoob.com   222
>3  3 Taobao www.taobao.com   333
>> print(is.data.frame(data))
>[1] TRUE
>> 
>~~~
>
>





### 读取XML

>R 语言读写 XML 文件需要安装扩展包
>
>~~~
>> any(grepl("XML",installed.packages()))
>[1] TRUE
>> # 载入 XML 包
>> library("XML")
>> # 设置文件名
>> result <- xmlParse(file = "sites.xml")
>> # 输出结果
>> print(result)
><?xml version="1.0"?>
><sites>
>  <site>
>    <id>1</id>
>    <name>Google</name>
>    <url>www.google.com</url>
>    <likes>111</likes>
>  </site>
>  <site>
>    <id>2</id>
>    <name>Runoob</name>
>    <url>www.runoob.com</url>
>    <likes>222</likes>
>  </site>
>  <site>
>    <id>3</id>
>    <name>Taobao</name>
>    <url>www.taobao.com</url>
>    <likes>333</likes>
>  </site>
></sites>
> 
>> # 提取根节点
>> rootnode <- xmlRoot(result)
>> # 统计数据量
>> rootsize <- xmlSize(rootnode)
>> # 输出结果
>> print(rootsize)
>[1] 3
>> # 查看第 2 个节点数据
>> print(rootnode[2])
>$site
><site>
>  <id>2</id>
>  <name>Runoob</name>
>  <url>www.runoob.com</url>
>  <likes>222</likes>
></site> 
>
>attr(,"class")
>[1] "XMLInternalNodeList" "XMLNodeList"        
>> # 查看第 2 个节点的第  1 个数据
>> print(rootnode[[2]][[1]])
><id>2</id> 
>~~~
>
>~~~> # 转为列表
>># xml 文件数据转为列表
>> xml_data <- xmlToList(result)
>> print(xml_data)
>> # xml 文件数据转为数据框
>> xmldataframe <- xmlToDataFrame("sites.xml")
>> print(xmldataframe)
>  id   name            url likes
>1  1 Google www.google.com   111
>2  2 Runoob www.runoob.com   222
>3  3 Taobao www.taobao.com   333
>
>~~~
>
>



### 读取Json

> R 语言读写 JSON 文件需要安装扩展包
>
> ~~~
> > install.packages("rjson")
> 试开URL’https://mirrors.tongji.edu.cn/CRAN/bin/windows/contrib/4.0/rjson_0.2.20.zip'
> Content type 'application/zip' length 755157 bytes (737 KB)
> downloaded 737 KB
> 
> package ‘rjson’ successfully unpacked and MD5 sums checked
> 
> The downloaded binary packages are in
> 	C:\Users\那年\AppData\Local\Temp\RtmpWyMnif\downloaded_packages
> > any(grepl("rjson",installed.packages()))
> [1] TRUE
> > # 载入 rjson 包
> > library("rjson")
> > # 获取 json 数据
> > result <- fromJSON(file = "sites.json")
> > # 输出结果
> > print(result)
> $id
> [1] "1" "2" "3"
> 
> $name
> [1] "Google" "Runoob" "Taobao"
> 
> $url
> [1] "www.google.com" "www.runoob.com" "www.taobao.com"
> 
> $likes
> [1] 111 222 333
> 
> > # 转为数据框
> > json_data_frame <- as.data.frame(result)
> > print(json_data_frame)
>   id   name            url likes
> 1  1 Google www.google.com   111
> 2  2 Runoob www.runoob.com   222
> 3  3 Taobao www.taobao.com   333
> ~~~
>
> 

### 连接MYSQL

>R 语言读写 MySQL 文件需要安装扩展包
>
>~~~
>> any(grepl("RMySQL",installed.packages()))
>[1] TRUE
>> library(RMySQL)
>载入需要的程辑包：DBI
>> # dbname 为数据库名，这边的参数请根据自己实际情况填写
>> mysqlconnection = dbConnect(MySQL(), user = 'root', password = 'root123', dbname = 'sys',host = 'localhost')
>>result = dbSendQuery(mysqlconnection, "select * from teacher")
>> data.frame = fetch(result,n=2)
>> print(data.frame)
>  id name age gender present like
>1  1 ????  25      1 ???????    ?
>2  2 ????  26      0    ????    ?
>~~~
>
>



## 绘图

支持中文字体安装

>install.packages("sysfonts") # 安装包 
>
>install.packages("showtext") # 安装包 
>
>library(showtext) # 加载包
>
>library(sysfonts) # 加载包



### 饼图

>```
>pie(x, labels = names(x), edges = 200, radius = 0.8,
>    clockwise = FALSE, init.angle = if(clockwise) 90 else 0,
>    density = NULL, angle = 45, col = NULL, border = NULL,
>    lty = NULL, main = NULL, …)
>```
>
>- x: 数值向量，表示每个扇形的面积。
>- labels: 字符型向量，表示各扇形面积标签。
>- edges: 这个参数用处不大，指的是多边形的边数（圆的轮廓类似很多边的多边形）。
>- radius: 饼图的半径。
>- main: 饼图的标题。
>- clockwise: 是一个逻辑值,用来指示饼图各个切片是否按顺时针做出分割。
>- angle: 设置底纹的斜率。
>- density: 底纹的密度。默认值为 NULL。
>- col: 是表示每个扇形的颜色，相当于调色板。

~~~
> # 数据准备
> info = c(1, 2, 4, 8)
> 
> # 命名
> names = c("Google", "Runoob", "Taobao", "Weibo")
> 
> # 涂色（可选）
> cols = c("#ED1C24","#22B14C","#FFC90E","#3f48CC")
> 
> # 绘图
> pie(info, labels=names, col=cols)
> 
~~~

![image-20210429151850309](C:\Users\那年\AppData\Roaming\Typora\typora-user-images\image-20210429151850309.png)

#### 输出保存

>~~~
>> # 数据准备
>> info = c(1, 2, 4, 8)
>> 
>> # 命名
>> names = c("Google", "Runoob", "Taobao", "Weibo")
>> 
>> # 涂色（可选）
>> cols = c("#ED1C24","#22B14C","#FFC90E","#3f48CC")
>> 
>> # 设置输出图片
>> png(file='runoob-pie.png', height=300, width=300)
>> # 绘图
>> pie(info, labels=names, col=cols)
>~~~

### 条形图

>```
>barplot(H,xlab,ylab,main, names.arg,col,beside)
>```
>
>- **H** 向量或矩阵，包含图表用的数字值，每个数值表示矩形条的高度。
>- **xlab** x 轴标签。
>- **ylab** y 轴标签。
>- **main** 图表标题。
>- **names.arg** 每个矩形条的名称。
>- **col** 每个矩形条的颜色。

~~~> cvd19 = c(83534,2640626,585493)
> cvd19 = c(83534,2640626,585493) 
> barplot(cvd19,
+         main="新冠疫情条形图",
+         col=c("#ED1C24","#22B14C","#FFC90E"),
+         names.arg=c("中国","美国","印度"),
+         family='GB1'
+ )
~~~

![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429162551.png)



### 函数曲线图

>```
>curve(expr, from = NULL, to = NULL, n = 101, add = FALSE,
>      type = "l", xname = "x", xlab = xname, ylab = NULL,
>      log = NULL, xlim = NULL, …)
>
># S3 函数的方法
>plot(x, y = 0, to = 1, from = y, xlim = NULL, ylab = NULL, …)
>```
>
>- expr：函数表达式
>- from 和 to：绘图的起止范围
>- n：一个整数值，表示 x 取值的数量
>- add：是一个逻辑值，当为 TRUE 时，表示将绘图添加到已存在的绘图中。
>- type：绘图的类型，p 为点、l 为直线， o 同时绘制点和线，且线穿过点。
>- xname：用于 x 轴变量的名称。
>- xlim 和 ylim 表示x轴和y轴的范围。
>- xlab，ylab：x 轴和 y 轴的标签名称。



### 散点图

>```
>plot(x, y, type="p", main, xlab, ylab, xlim, ylim, axes)
>```
>
>- **x** 横坐标 x 轴的数据集合
>- **y** 纵坐标 y 轴的数据集合
>- type：绘图的类型，p 为点、l 为直线， o 同时绘制点和线，且线穿过点。
>- **main** 图表标题。
>- **xlab、ylab** x 轴和 y 轴的标签名称。
>- **xlim、ylim** x 轴和 y 轴的范围。
>- **axes** 布尔值，是否绘制两个 x 轴。
>
>type 参数可选择值：
>
>- p：点图
>- l：线图
>- b：同时绘制点和线
>- c：仅绘制参数 b 所示的线
>- o：同时绘制点和线，且线穿过点
>- h：绘制出点到横坐标轴的垂直线
>- s：阶梯图，先横后纵
>- S：阶梯图，先纵后竖
>- n： 空图

### 组合条形图和堆积条形图

> ~~~
> # Create the input vectors.
> colors <- c("green","orange","brown")
> months <- c("Mar","Apr","May","Jun","Jul")
> regions <- c("East","West","North")
> 
> # Create the matrix of the values.
> Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11),nrow = 3,ncol = 5,byrow = TRUE)
> 
> # Create the bar chart.
> barplot(Values,main = "total revenue",names.arg = months,xlab = "month",ylab = "revenue",
>         col = colors)
> 
> # Add the legend to the chart.
> legend("topleft", regions, cex = 1.3, fill = colors)
> 
> ~~~
>
> ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429164806.png)

### 箱线图

在R语言中创建箱线图的基本语法是：

~~~
boxplot(x, data, notch, varwidth, names, main)
~~~

以下是所使用的参数的描述 -

- **x**是向量或公式。
- 数据是数据帧。
- **notch**是逻辑值。 设置为TRUE以绘制凹口。
- **varwidth**是一个逻辑值。 设置为true以绘制与样本大小成比例的框的宽度。
- **names**是将打印在每个箱线图下的组标签。
- **main**用于给图表标题。

>~~~
># Plot the chart.
>boxplot(mpg ~ cyl, data = mtcars, 
>   xlab = "Number of Cylinders",
>   ylab = "Miles Per Gallon", 
>   main = "Mileage Data",
>   notch = TRUE, 
>   varwidth = TRUE, 
>   col = c("green","yellow","purple"),
>   names = c("High","Medium","Low")
>)
>~~~
>
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210429165002.png)
>
>
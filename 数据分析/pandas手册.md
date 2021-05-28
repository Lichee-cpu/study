# Pandas

[TOC]



### 读取文件

#### csv

	>```
	>import pandas as pd
	>fpath = "./datas/ml-latest-small/ratings.csv"
	>ratings = pd.read_csv(fpath)
	>
	>print(ratings.head())		# 查看前几行数据
	>print(ratings.shape)		# 查看数据行与列数
	>print(ratings.columns)		# 查看列名列表
	>print(ratings.index)		# 查看索引
	>print(ratings.dtypes)		# 查看数据类型
	>```

#### txt

>```
>import pandas as pd
>fpath = "./datas/crazyant/access_pvuv.txt"
>pruv = pd.read_csv(
>    fpath,
>    sep="\t",
>    header=None,
>    names=['pdate','pv','uv']
>)
>```

#### xlsx

>```
>import pandas as pd
>fpath = "./datas/crazyant/access_pvuv.xlsx"
>pruv = pd.read_excel(fpath)
>```

#### mysql

>```
>import pymysql
>conn = pymysql.connect(
>    host='127.0.0.1',
>    user='root',
>    password='root123',
>    database='sys',
>    charset='utf8'
>    )
>msql_page = pd.read_sql("select * from student",con=conn)
>```

### 数据结构

```
import pandas as pd
import numpy as np
```

#### Series

这是一种类似于一位数组对象，由不同数据类型和一组相关的数据索引组成

>```
>s1 = pd.Series([1,'ab',5,9,'ss'])
>print(s1)  			# 左侧索引 右侧数据
>print(s1.index)  	# 获取索引
>print(s1.values)  	# 获取数据
>print(s1[1])		# 获取指定索引数据
>
>s2 = pd.Series([1,'a',8.5,9],index=['a','b','c','d'])   	# 一个具有索引标签的Series
>print(s2)
>s3 = pd.Series({'Ohio':3500,'Texas':72000,'Utah':5000})  	# 使用python字典创建Series
>print(s3)
>```

#### DataFrame

相当于一个数据表格，类似于Excel一样

>```
>data={
>        'state':['Ohio','Ohio','Ohio','Nevada','Nevada'],
>        'year':[2000,2001,2002,2001,2002],
>        'pop':[1.5,1.7,3.6,2.4,2.9]
>    }
>df = pd.DataFrame(data)
>print(df)
>print(df.dtypes)		# 查看数据类型
>print(df.columns)		# 查看列名
>```

#### 从DataFrame查询Series

如果只查询一行、一列，返回的是pd.Series

如果查询多行、多列，返回的是pd.DataFrame

>```
>data={
>        'state':['Ohio','Ohio','Ohio','Nevada','Nevada'],
>        'year':[2000,2001,2002,2001,2002],
>        'pop':[1.5,1.7,3.6,2.4,2.9]
>    }
>df = pd.DataFrame(data)
>
>print(df['year'])  			# 查询一列，结果是pd.Series
>print(type(df['year']))		# 查看数据类型
>print(df[['year','pop']]) 	# 查询多列，结果是一个DataFrame
>print(type(df.loc[1])  		# 查询一行，结果是pd.Seroes
>print(df.loc[1:2])			# 查询多行又是DataFrom
>```

### 数据查询

查询方法：

1. df.loc 方法，根据行、列的标签值查询（既能查询又能覆盖写入--推荐）
2. df.iloc 方法，根据行、列的数字位置查询
3. df.where 方法
4. df.query 方法

```
import pandas as pd
print(pd.__version__)  # 查看pandas的版本
df = pd.read_csv("./datas/beijing_tianqi/beijing_tianqi_2018.csv")
# 设定索引为日期，方便按照日期筛选
df.set_index('ymd',inplace=True)
# 字符串处理
df.index
# 替换温度符号（清洗）
df.loc[:,"bWendu"] = df["bWendu"].str.replace("℃","").astype("int32")
df.loc[:,"yWendu"] = df["yWendu"].str.replace("℃","").astype("int32")
```



#### df.loc

>```
># 得到单个值
>df.loc['2018-01-03', 'bWendu']
># 得到一个Series
>df.loc['2018-01-03',['bWendu','yWendu']]
>```

##### 用值列表批量查询

>```
># 得到一个Series
>df.loc[['2018-01-03','2018-01-04','2018-01-05'],'bWendu']
># 得到DataFrame
>df.loc[['2018-01-03','2018-01-04','2018-01-05'],['bWendu','yWendu']]
>```

##### 数值期间进行范围查询

>```
># 行index按区间  查询是闭区间
>df.loc['2018-01-03':'2018-01-09','bWendu']
># 列index区间
>df.loc['2018-01-03','bWendu':'fengxiang']
># 按照行列区间查询
>df.loc['2018-01-03':'2018-01-05','bWendu':'fengxiang']
>```

#### df.where

>```
># 查询温度小于-10的所有
>df.loc[df['yWendu']<-10,:]
># 查看boolean条件
>df['yWendu']<-10
># 查询最高温度小于30度，并且最低温度大于15度，并且是晴天，并且天气为优的数据
>df.loc[(df["bWendu"]<=30) & (df["yWendu"]>=15) & (df["tianqi"]=='晴') & (df["aqiLevel"]==1), :]
>
>```

##### 调用函数查询

>```
># 直接写lambda表达式
>df.loc[lambda df : (df['bWendu']<=30) & (df['yWendu']>=15), :]
>
># 编写自己的函数，查询9月份，空气质量好的数据
>def query_my_data(df):
>    return df.index.str.startswith("2018-09") & (df['aqiLevel']==1)
>df.loc[query_my_data, :]
>```



### 增加数据

方法

1.直接赋值

2.df.apply 方法

3.df.assign 方法

4.按条件选择分组分别赋值

```
import pandas as pd
fpath = "./datas/beijing_tianqi/beijing_tianqi_2018.csv"
df = pd.read_csv(fpath)
df.head()
```

#### 直接赋值

> ```
> # 替换温度后的符号
> df.loc[:, "bWendu"] = df["bWendu"].str.replace("℃", "").astype('int32')
> df.loc[:, "yWendu"] = df["yWendu"].str.replace("℃", "").astype('int32')
> 
> # 新增一列计算出温度差
> df.loc[:,'wencha'] = df['bWendu']-df['yWendu']
> ```

#### df.apply

>判断增加，气温高于33属于高温
>
>```
>def get_wendu_type(x):
>    if x['bWendu']>33:
>        return '高温'
>    if x['yWendu']<-10:
>        return '低温'
>    return '常温'
>
>
># axis==1表示sersies是index还是colums
>df.loc[:,'wendu_type'] = df.apply(get_wendu_type, axis=1)  # 1表示列名
>```

#### df.assgin

>同时增加多个列，例如最高最低的华氏温度
>
>```
># 同时添加多个新的列
>df.assign(
>    yWendu_huashi = lambda x: x['yWendu']*9*5+32,
>    # 摄氏度转华氏度
>    bWendu_huashi = lambda x: x['bWendu']*9/5+35
>)
>```

#### 按条件分组赋值

>```
># 先创建空列
>df['wencha_type'] = ''
>df.loc[df['bWendu']-df['yWendu']>10,'wendu_type'] = '温差大'
>df.loc[df['bWendu']-df['yWendu']<10,'wendu_type'] = '温差正常'
>
>df["wencha_type"].value_counts()  		# 统计记录
>```

### 统计数据

1.汇总类统计

2.唯一去重和按值计数

3.相关系数和协方差

```
import pandas as pd
fpath = './datas/beijing_tianqi/beijing_tianqi_2018.csv'
df = pd.read_csv(fpath)
# 替换温度后缀
df.loc[:, "bWendu"] = df["bWendu"].str.replace("℃", "").astype('int32')
df.loc[:, "yWendu"] = df["yWendu"].str.replace("℃", "").astype('int32')
```

#### 汇总统计

>```
># 一下提取所有数字列统计结果
>df.describe()
>
># 查看单个Series的数据
>df['bWendu'].mean()
>
># 最高温度
>df['bWendu'].max()
>
># 最低温度
>df['bWendu'].min()
>```

#### 唯一去重和按值计数

>唯一去重
>
>```
>df['fengxiang'].unique()		# 得到风向['东北风', '北风', '西北风', '西南风', '南风', '东南风', '东风', '西风']
>df['fengli'].unique()			# 得到分力['1-2级', '4-5级', '3-4级', '2级', '1级', '3级']
>```
>
>按值计数
>
>```
>df['fengxiang'].value_counts()		# 统计风向唯一去重后的个数
>```

#### 相关系数和协方差

1. 协方差：衡量同向反向程度，如果协方差为正，说明X，Y同向变化，协方差越大说明同向程度越高；如果协方差为负，说明X，Y反向运动，协方差越小说明反向程度越高。
2. 相关系数：衡量相似度程度，当他们的相关系数为1时，说明两个变量变化时的正向相似度最大，当相关系数为－1时，说明两个变量变化的反向相似度最大

>```
># 协方差矩阵：
>df.cov()
>
># 相关系数矩阵
>df.corr()
>
># 单独查看空气质量和最高温度的相关系数
>df['aqi'].corr(df['bWendu'])
>df['aqi'].corr(df['yWendu'])
>
># 空气质量和温差的相关系数
>df['aqi'].corr(df['bWendu']-df['yWendu'])		# 得出结论：可以看到空气质量与温度没有多大关系，但是与温差较大的关系
>```

### 缺省处理

- isnull和notnull：检测是否是空值，可用于df和series
 - dropna：丢弃、删除缺失值
    - axis : 删除行还是列，{0 or ‘index’, 1 or ‘columns’}, default 0
    - how : 如果等于any则任何值为空都删除，如果等于all则所有值都为空才删除
    - inplace : 如果为True则修改当前df，否则返回新的df
 - fillna：填充空值
    - value：用于填充的值，可以是单个值，或者字典（key是列名，value是值）
    - method : 等于ffill使用前一个不为空的值填充forword fill；等于bfill使用后一个不为空的值填充backword fill
    - axis : 按行还是列填充，{0 or ‘index’, 1 or ‘columns’}
    - inplace : 如果为True则修改当前df，否则返回新的df

##### **实例**：Excel的读取、清洗、处理

>##### 步骤一：读取文件，忽略前几个空行
>
>```
>import pandas as pd
>studf = pd.read_excel("./datas/student_excel/student_excel.xlsx",skiprows=2)
>```
>
>##### 步骤二：检测空值
>
>```
>studf.isnull()
># 筛选没有空分数的行
>studf.loc[studf['分数'].notnull(),:]
>```
>
>##### 步骤三：删掉全是空值的列、空值的行
>
>```
>studf.dropna(axis='columns',how='all',inplace=True)
>studf.dropna(axis="index", how='all', inplace=True)
>```
>
>##### 步骤四： 将分数列为空的填充为0
>
>```
>studf.fillna({'分数':0})
>
># 等同于
>studf.loc[:,'分数'] = studf['分数'].fillna(0)
>```
>
>##### 步骤五：将姓名缺失值填充
>
>```
>studf.loc[:,'姓名']= studf['姓名'].fillna(method="ffill")
>```
>
>##### 步骤六：将清洗好的excel保存
>
>```
>studf.to_excel("./datas/student_excel/stu_claen.xlsx",index=True)
>```

### 数据排序

**Series.sort_values(ascending=True, inplace=False)**
参数说明：

- ascending：默认为True升序排序，False降序排序
- inplace：是否修改原始Series

**DataFrame.sort_values(by, ascending=True, inplace=False)**
参数说明：

- by：字符串或者List<字符串>，单列排序或者多列排序
- ascending：bool或者List，升序还是降序，如果是list对应by的多列
- inplace：是否修改原始DataFrame

```
import pandas as pd
fpath = "./datas/beijing_tianqi/beijing_tianqi_2018.csv"
df = pd.read_csv(fpath)

# 替换掉温度的后缀℃
df.loc[:, "bWendu"] = df["bWendu"].str.replace("℃", "").astype('int32')
df.loc[:, "yWendu"] = df["yWendu"].str.replace("℃", "").astype('int32')
```

#### series排序

>```
>df['aqi'].sort_values()
>df['aqi'].sort_values(ascending=False)
>```

#### DataFrame排序

> ```
> # 单序列排序
> df.sort_values(by='aqi')
> 
> # 两个字段都是降序
> df.sort_values(by=['aqiLevel','bWendu'],ascending=False)
> 
> # 分别指定升序和降序
> df.sort_values(by=['aqiLevel','bWendu'],ascending=[True,False])
> ```

### 字符串处理

df["bWendu"].str.replace("℃", "").astype('int32')

Pandas的字符串处理：

>1. 使用方法：先获取Series的str属性，然后在属性上调用函数；
>2. 只能在字符串列上使用，不能数字列上使用；
>3. Dataframe上没有str属性和处理方法
>4. Series.str并不是Python原生字符串，而是自己的一套方法，不过大部分和原生str很相似；

```
import pandas as pd
fpath = "./datas/beijing_tianqi/beijing_tianqi_2018.csv"
df = pd.read_csv(fpath)
df.head()
```

#### 获取series的str属性，使用各种字符串处理函数

>```
>df['bWendu'].str
># 字符串替换函数
>df['bWendu'].str.replace("℃",'')
>
># 判断是不是数字
>df['bWendu'].str.isnumeric()
>
>```

#### 使用str的startswith、contains等得到bool的Series可以做条件查询

>```
>condition = df["ymd"].str.startswith("2018-03")
>df[condition].head()
>```

#### 需要多次str处理的链式操作

>怎样提取201803这样的数字月份？
>1、先将日期2018-03-31替换成20180331的形式
>2、提取月份字符串201803
>
>```
>df["ymd"].str.replace("-", "")
>
># 每次调用函数，都返回一个新Series
>df["ymd"].str.replace("-", "").str.slice(0, 6)
>
># slice就是切片语法，可以直接用
>df["ymd"].str.replace("-", "").str[0:6]
>```

#### 使用正则表达式的处理

>```
># 添加新列
>def get_nianyueri(x):
>    year,month,day = x["ymd"].split("-")
>    return f"{year}年{month}月{day}日"
>df["中文日期"] = df.apply(get_nianyueri, axis=1)
>```
>
>问题：怎样将“2018年12月31日”中的年、月、日三个中文字符去除？
>
>```
># 方法1：链式replace
>df["中文日期"].str.replace("年", "").str.replace("月","").str.replace("日", "")
>
># 方法2：正则表达式替换
>df["中文日期"].str.replace("[年月日]", "")
>```

### 理解axis

0是行，1是列

- axis=0或者"index"：
  - 如果是单行操作，就指的是某一行
  - 如果是聚合操作，指的是跨行cross rows
- axis=1或者"columns"：
  - 如果是单列操作，就指的是某一列
  - 如果是聚合操作，指的是跨列cross columns

```
import pandas as pd
import numpy as np
df = pd.DataFrame(
    np.arange(12).reshape(3,4),
    columns=['A', 'B', 'C', 'D']
)
```

#### 单列或单行drop

>```
># 代表的就是删除某列
>df.drop("A", axis=1)
>
># 代表的就是删除某行
>df.drop(1, axis=0)
>```

#### 按axis执行mean聚合操作

>#### 按axis=0/index执行mean聚合操作
>
>```
># axis=0 or axis=index
>df.mean(axis=0)  	# 指定了按哪个axis，就是这个axis要动起来(类似被for遍历)，其它的axis保持不动
>```
>
>#### 按axis=1/columns执行mean聚合操作
>
>```
># axis=1 or axis=columns
>df.mean(axis=1)		# 指定了按哪个axis，就是这个axis要动起来(类似被for遍历)，其它的axis保持不动
>```
>
>```
>def get_sum_value(x):
>    return x["A"] + x["B"] + x["C"] + x["D"]
>
>df["sum_value"] = df.apply(get_sum_value, axis=1)
>```

### 索引

```
import pandas as pd
df = pd.read_csv("./datas/ml-latest-small/ratings.csv")
```

#### 使用index查询数据

>```
># drop==False，让索引列还保持在column
>df.set_index("userId", inplace=True, drop=False)
>df.index
>
># 使用index的查询方法
>df.loc[500].head(5)
>
># 使用column的condition查询方法
>df.loc[df["userId"] == 500].head()
>```

#### 使用index会提升查询性能

- 如果index是唯一的，Pandas会使用哈希表优化，查询性能为O(1);
- 如果index不是唯一的，但是有序，Pandas会使用二分查找算法，查询性能为O(logN);
- 如果index是完全随机的，那么每次查询都要扫描全表，查询性能为O(N);

>完全随机的顺序查询
>
>```
># 将数据随机打散
>from sklearn.utils import shuffle
>df_shuffle = shuffle(df)
>
>df_shuffle.head()
>
># 索引是否是递增的
>df_shuffle.index.is_monotonic_increasing		# false
>
>df_shuffle.index.is_unique						# false
>
># 计时，查询id==500数据性能
>%timeit df_shuffle.loc[500]
>```
>
>将index排序后的查询
>
>```
>df_sorted = df_shuffle.sort_index()
>
># 索引是否是递增的
>df_sorted.index.is_monotonic_increasing			# True
>
>df_sorted.index.is_unique						# false
>
>%timeit df_sorted.loc[500]
>```

#### 使用index能自动对齐数据(包括series和dataframe)

>```
>s1 = pd.Series([1,2,3], index=list("abc"))
>s2 = pd.Series([2,3,4], index=list("bcd"))
>s1+s2		
>```
>
>>```
>>a    NaN
>>b    4.0
>>c    6.0
>>d    NaN
>>dtype: float64
>>```

#### 使用index更多更强大的数据结构支持

**很多强大的索引数据结构**

- CategoricalIndex，基于分类数据的Index，提升性能；
- MultiIndex，多维索引，用于groupby多维聚合后结果等；
- DatetimeIndex，时间类型索引，强大的日期和时间的方法支持；



### DateFrame的Merge

Pandas的Merge，相当于Sql的Join，将不同的表按key关联到一个表

**[merge的语法](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.merge.html)：**

pd.merge(left, right, how='inner', on=None, left_on=None, right_on=None, left_index=False, right_index=False, sort=True, suffixes=('*x', '*y'), copy=True, indicator=False, validate=None)

- left，right：要merge的dataframe或者有name的Series
- how：join类型，'left', 'right', 'outer', 'inner'
- on：join的key，left和right都需要有这个key
- left_on：left的df或者series的key
- right_on：right的df或者seires的key
- left_index，right_index：使用index而不是普通的column做join
- suffixes：两个元素的后缀，如果列有重名，自动添加后缀，默认是('*x', '*y')

#### 电影数据集的join实例

>#### 电影评分数据集
>
>是推荐系统研究的很好的数据集
>位于本代码目录：./datas/movielens-1m
>
>包含三个文件：
>
>1. 用户对电影的评分数据 ratings.dat
>2. 用户本身的信息数据 users.dat
>3. 电影本身的数据 movies.dat
>
>可以关联三个表，得到一个完整的大表
>
>数据集官方地址：https://grouplens.org/datasets/movielens/

```
import pandas as pd
df_ratings = pd.read_csv(
    "./datas/movielens-1m/ratings.dat", 
    sep="::",
    engine='python', 
    names="UserID::MovieID::Rating::Timestamp".split("::")
)
df_users = pd.read_csv(
    "./datas/movielens-1m/users.dat", 
    sep="::",
    engine='python', 
    names="UserID::Gender::Age::Occupation::Zip-code".split("::")
)
df_movies = pd.read_csv(
    "./datas/movielens-1m/movies.dat", 
    sep="::",
    engine='python', 
    names="MovieID::Title::Genres".split("::")
)

# 连接表
df_ratings_users = pd.merge(
   df_ratings, df_users, left_on="UserID", right_on="UserID", how="inner"
)

# 再次连接
df_ratings_users_movies = pd.merge(
    df_ratings_users, df_movies, left_on="MovieID", right_on="MovieID", how="inner"
)
```

#### 理解merge时数量的对齐关系

>以下关系要正确理解：
>
>- one-to-one：一对一关系，关联的key都是唯一的
>  - 比如(学号，姓名) merge (学号，年龄)
>  - 结果条数为：1*1
>- one-to-many：一对多关系，左边唯一key，右边不唯一key
>  - 比如(学号，姓名) merge (学号，[语文成绩、数学成绩、英语成绩])
>  - 结果条数为：1*N
>- many-to-many：多对多关系，左边右边都不是唯一的
>  - 比如（学号，[语文成绩、数学成绩、英语成绩]） merge (学号，[篮球、足球、乒乓球])
>  - 结果条数为：M*N



>#### one-to-one 一对一关系的merge
>
>```
>left = pd.DataFrame({'sno': [11, 12, 13, 14],
>                      'name': ['name_a', 'name_b', 'name_c', 'name_d']
>                    })
>right = pd.DataFrame({'sno': [11, 12, 13, 14],
>                      'age': ['21', '22', '23', '24']
>                    })
># 一对一关系，结果中有4条
>pd.merge(left, right, on='sno')
>```
>
>####  one-to-many 一对多关系的merge
>
>```
>left = pd.DataFrame({'sno': [11, 12, 13, 14],
>                      'name': ['name_a', 'name_b', 'name_c', 'name_d']
>                    })
>right = pd.DataFrame({'sno': [11, 11, 11, 12, 12, 13],
>                       'grade': ['语文88', '数学90', '英语75','语文66', '数学55', '英语29']
>                     })
># 数目以多的一边为准
>pd.merge(left, right, on='sno')
>```
>
>#### many-to-many 多对多关系的merge
>
>```
>left = pd.DataFrame({'sno': [11, 11, 12, 12,12],
>                      '爱好': ['篮球', '羽毛球', '乒乓球', '篮球', "足球"]
>                    })
>right = pd.DataFrame({'sno': [11, 11, 11, 12, 12, 13],
>                       'grade': ['语文88', '数学90', '英语75','语文66', '数学55', '英语29']
>                     })
>pd.merge(left, right, on='sno')
>```

#### 理解left join、right join、inner join、outer join的区别

>```
>left = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
>                      'A': ['A0', 'A1', 'A2', 'A3'],
>                      'B': ['B0', 'B1', 'B2', 'B3']})
>
>right = pd.DataFrame({'key': ['K0', 'K1', 'K4', 'K5'],
>                      'C': ['C0', 'C1', 'C4', 'C5'],
>                      'D': ['D0', 'D1', 'D4', 'D5']})
>```
>
>#### inner join，默认
>
>左边和右边的key都有，才会出现在结果里
>
>```
>pd.merge(left, right, how='inner')
>```
>
>#### left join
>
>左边的都会出现在结果里，右边的如果无法匹配则为Null
>
>```
>pd.merge(left, right, how='left')
>```
>
>#### right join
>
>右边的都会出现在结果里，左边的如果无法匹配则为Null
>
>```
>pd.merge(left, right, how='right')
>```
>
>#### outer join
>
>左边、右边的都会出现在结果里，如果无法匹配则为Null
>
>```
>pd.merge(left, right, how='outer')
>```

#### 如果出现非Key的字段重名怎么办

>```
>left = pd.DataFrame({'key': ['K0', 'K1', 'K2', 'K3'],
>                      'A': ['A0', 'A1', 'A2', 'A3'],
>                      'B': ['B0', 'B1', 'B2', 'B3']})
>
>right = pd.DataFrame({'key': ['K0', 'K1', 'K4', 'K5'],
>                      'A': ['A10', 'A11', 'A12', 'A13'],
>                      'D': ['D0', 'D1', 'D4', 'D5']})
>pd.merge(left, right, on='key')             # 打印重复的键，会有多个值
>pd.merge(left, right, on='key', suffixes=('_left', '_right'))	 # 打印重复的键，会有多个值
>```



### 数据的合并concat

**concat语法：pandas.concat(objs, axis=0, join='outer', ignore_index=False)**

- objs：一个列表，内容可以是DataFrame或者Series，可以混合
- axis：默认是0代表按行合并，如果等于1代表按列合并
- join：合并的时候索引的对齐方式，默认是outer join，也可以是inner join
- ignore_index：是否忽略掉原来的数据索引

**append语法：DataFrame.append(other, ignore_index=False)**

append只有按行合并，没有按列合并，相当于concat按行的简写形式

- other：单个dataframe、series、dict，或者列表
- ignore_index：是否忽略掉原来的数据索引

```
import pandas as pd

import warnings
warnings.filterwarnings('ignore')
```

#### 使用pandas.concat合并数据

> ```
> df1 = pd.DataFrame({'A': ['A0', 'A1', 'A2', 'A3'],
>                  'B': ['B0', 'B1', 'B2', 'B3'],
>                  'C': ['C0', 'C1', 'C2', 'C3'],
>                  'D': ['D0', 'D1', 'D2', 'D3'],
>                  'E': ['E0', 'E1', 'E2', 'E3']
>                 })
> df2 = pd.DataFrame({ 'A': ['A4', 'A5', 'A6', 'A7'],
>                   'B': ['B4', 'B5', 'B6', 'B7'],
>                   'C': ['C4', 'C5', 'C6', 'C7'],
>                   'D': ['D4', 'D5', 'D6', 'D7'],
>                   'F': ['F4', 'F5', 'F6', 'F7']
>                 })                   
>                 
> ```
>
> **1、默认的concat，参数为axis=0、join=outer、ignore_index=False**
>
> ```
> pd.concat([df1,df2])
> ```
>
> **2、使用ignore_index=True可以忽略原来的索引**
>
> ```
> pd.concat([df1,df2], ignore_index=True)
> ```
>
> **3、使用join=inner过滤掉不匹配的列**
>
> ```
> pd.concat([df1,df2], ignore_index=True, join="inner")
> ```
>
> **4、使用axis=1相当于添加新列**
>
> ```
> df1
> # 添加一列Series
> s1 = pd.Series(list(range(4)), name="F")
> pd.concat([df1,s1], axis=1)
> 
> # 添加多列Series
> s2 = df1.apply(lambda x:x["A"]+"_GG", axis=1)
> s2.name="G"
> pd.concat([df1,s1,s2], axis=1)
> 
> 
> # 列表可以只有Series
> pd.concat([s1,s2], axis=1)
> 
> # 列表是可以混合顺序的
> pd.concat([s1,df1,s2], axis=1)
> ```
>

#### 使用DataFrame.append按行合并数据

> ```
> df1 = pd.DataFrame([[1, 2], [3, 4]], columns=list('AB'))
> df2 = pd.DataFrame([[5, 6], [7, 8]], columns=list('AB'))
> 
> # 给1个dataframe添加另一个dataframe
> df1.append(df2)
> 
> # 忽略原来的索引ignore_index=True
> df1.append(df2, ignore_index=True)
> 
> # 可以一行一行的给DataFrame添加数据
> # 一个空的df
> df = pd.DataFrame(columns=['A'])
> 
> # A：低性能版本
> for i in range(5):
>     # 注意这里每次都在复制
>     df = df.append({'A': i}, ignore_index=True)
> df
> 
> # B：性能好的版本
> # 第一个入参是一个列表，避免了多次复制
> pd.concat(
>     [pd.DataFrame([i], columns=['A']) for i in range(5)],
>     ignore_index=True
> )
> ```



### 批量拆分合并Excel

1. 将一个大Excel等份拆成多个Excel
2. 将多个小Excel合并成一个大Excel并标记来源

```
work_dir="./course_datas/c15_excel_split_merge"
splits_dir=f"{work_dir}/splits"

import os
if not os.path.exists(splits_dir):
    os.mkdir(splits_dir)
    
import pandas as pd
df_source = pd.read_excel(f"{work_dir}/crazyant_blog_articles_source.xlsx")
df_source.shape			# 查看行列
total_row_count = df_source.shape[0]
total_row_count
```

#### 将一个大Excel等份拆成多个Excel

1. 使用df.iloc方法，将一个大的dataframe，拆分成多个小dataframe
2. 将使用dataframe.to_excel保存每个小Excel

> #### 计算拆分后的每个excel的行数
>
> ```
> # 这个大excel，会拆分给这几个人
> user_names = ["xiao_shuai", "xiao_wang", "xiao_ming", "xiao_lei", "xiao_bo", "xiao_hong"]
> 
> # 每个人的任务数目
> split_size = total_row_count // len(user_names)
> if total_row_count % len(user_names) != 0:
>     split_size += 1
> 
> split_size
> ```
>
> #### 拆分成多个dataframe
>
> ```
> df_subs = []
> for idx, user_name in enumerate(user_names):
>     # iloc的开始索引
>     begin = idx*split_size
>     # iloc的结束索引
>     end = begin+split_size
>     # 实现df按照iloc拆分
>     df_sub = df_source.iloc[begin:end]
>     # 将每个子df存入列表
>     df_subs.append((idx, user_name, df_sub))
> ```
>
> #### 将每个datafame存入excel
>
> ```
> for idx, user_name, df_sub in df_subs:
>     file_name = f"{splits_dir}/crazyant_blog_articles_{idx}_{user_name}.xlsx"
>     df_sub.to_excel(file_name, index=False)
> ```

#### 合并多个小Excel到一个大Excel

1. 遍历文件夹，得到要合并的Excel文件列表
2. 分别读取到dataframe，给每个df添加一列用于标记来源
3. 使用pd.concat进行df批量合并
4. 将合并后的dataframe输出到excel

> #### 遍历文件夹，得到要合并的Excel名称列表
>
> ```
> import os
> excel_names = []
> for excel_name in os.listdir(splits_dir):
>     excel_names.append(excel_name)
> excel_names
> ```
>
> #### 分别读取到dataframe
>
> ```
> df_list = []
> 
> for excel_name in excel_names:
>     # 读取每个excel到df
>     excel_path = f"{splits_dir}/{excel_name}"
>     df_split = pd.read_excel(excel_path)
>     # 得到username
>     username = excel_name.replace("crazyant_blog_articles_", "").replace(".xlsx", "")[2:]
>     print(excel_name, username)
>     # 给每个df添加1列，即用户名字
>     df_split["username"] = username
>     
>     df_list.append(df_split)
> ```
>
> #### 使用pd.concat进行合并
>
> ```
> df_merged = pd.concat(df_list)
> df_merged.shape
> df_merged.head()
> df_merged["username"].value_counts()
> ```
>
> #### 将合并后的dataframe输出到excel
>
> ```
> df_merged.to_excel(f"{work_dir}/crazyant_blog_articles_merged.xlsx", index=False)
> ```
>

### 分组聚合groupby

groupby：先对数据分组，然后在每个分组上应用聚合函数、转换函数

本次演示：
一、分组使用聚合函数做数据统计
二、遍历groupby的结果理解执行流程
三、实例分组探索天气数据

```
import pandas as pd
import numpy as np
# 加上这一句，能在jupyter notebook展示matplot图表
%matplotlib inline
df = pd.DataFrame({'A': ['foo', 'bar', 'foo', 'bar', 'foo', 'bar', 'foo', 'foo'],
                   'B': ['one', 'one', 'two', 'three', 'two', 'two', 'one', 'three'],
                   'C': np.random.randn(8),
                   'D': np.random.randn(8)})
df
```

#### 分组使用聚合函数做数据统计

>1、单个列groupby，查询所有数据列的统计
>
>```
>df.groupby('A').sum()
>```
>
>2、多个列groupby，查询所有数据列的统计
>
>```
>df.groupby(['A','B']).mean()  		# ('A','B')成对变成了二级索引
>df.groupby(['A','B'], as_index=False).mean()		# 
>```
>
>3、同时查看多种数据统计
>
>```
>df.groupby('A').agg([np.sum, np.mean, np.std])		# 列变成了多级索引
>```
>
>4、查看单列的结果数据统计
>
>```
># 方法1：预过滤，性能更好
>df.groupby('A')['C'].agg([np.sum, np.mean, np.std])
>
># 方法2
>df.groupby('A').agg([np.sum, np.mean, np.std])['C']
>
>```
>
>5、不同列使用不同的聚合函数
>
>```
>df.groupby('A').agg({"C":np.sum, "D":np.mean})
>```

#### 遍历groupby的结果理解执行流程

>##### 1、遍历单个列聚合的分组
>
>```
>g = df.groupby('A')
>for name,group in g:
>    print(name)
>    print(group)
>    print()
>```
>
>**可以获取单个分组的数据**
>
>```
>g.get_group('bar')
>```
>
>##### 2、遍历多个列聚合的分组
>
>```
>g = df.groupby(['A', 'B'])
>for name,group in g:
>    print(name)
>    print(group)
>    print()
>    
>g.get_group(('foo', 'one'))
>```
>
>**以直接查询group后的某几列，生成Series或者子DataFrame**
>
>```
>g['C']
>for name, group in g['C']:
>    print(name)
>    print(group)
>    print(type(group))
>    print()
>    
>```

#### 实例分组探索天气数据

>```
>fpath = "./datas/beijing_tianqi/beijing_tianqi_2018.csv"
>df = pd.read_csv(fpath)
># 替换掉温度的后缀℃
>df.loc[:, "bWendu"] = df["bWendu"].str.replace("℃", "").astype('int32')
>df.loc[:, "yWendu"] = df["yWendu"].str.replace("℃", "").astype('int32')
>df.head()
>
># 新增一列为月份
>df['month'] = df['ymd'].str[:7]
>df.head()
>```
>
>1、查看每个月的最高温度
>
>```
>data = df.groupby('month')['bWendu'].max()
>type(data)
>data.plot() 			# 绘图
>```
>
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210528174945.png)
>
>2、查看每个月的最高温度、最低温度、平均空气质量指数
>
>```
>group_data = df.groupby('month').agg({"bWendu":np.max, "yWendu":np.min, "aqi":np.mean})
>group_data
>group_data.plot()
>```
>
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210528175043.png)
>

### 分层索引MultiIndex

为什么要学习分层索引MultiIndex？

- 分层索引：在一个轴向上拥有多个索引层级，可以表达更高维度数据的形式；
- 可以更方便的进行数据筛选，如果有序则性能更好；
- groupby等操作的结果，如果是多KEY，结果是分层索引，需要会使用
- 一般不需要自己创建分层索引(MultiIndex有构造函数但一般不用)

>```
>import pandas as pd
>%matplotlib inline
>stocks = pd.read_excel('./datas/stocks/互联网公司股票.xlsx')
>stocks["公司"].unique()
>stocks.index
>stocks.groupby('公司')["收盘"].mean()
>```

#### Series的分层索引MultiIndex

>```
>ser = stocks.groupby(['公司', '日期'])['收盘'].mean()
># unstack把二级索引变成列
>ser.unstack()
>
>ser.reset_index()			# 删除空值的行,两层索引
>
>```

#### Series有多层索引MultiIndex怎样筛选数据

>```
>ser.loc['BIDU']
>
># 多层索引，可以用元组的形式筛选
>ser.loc[('BIDU', '2019-10-02')]
>ser.loc[:, '2019-10-02']
>```

#### DataFrame的多层索引MultiIndex

>```
>stocks.set_index(['公司', '日期'], inplace=True)
>stocks.sort_index(inplace=True)
>stocks
>```

#### DataFrame有多层索引MultiIndex怎样筛选数据

- 元组(key1,key2)代表筛选多层索引，其中key1是索引第一级，key2是第二级，比如key1=JD, key2=2019-10-02
- 列表[key1,key2]代表同一层的多个KEY，其中key1和key2是并列的同级索引，比如key1=JD, key2=BIDU

>```
>stocks.loc['BIDU']
>stocks.loc[('BIDU', '2019-10-02'), :]
>stocks.loc[['BIDU', 'JD'], :]		# 查看BIDU，JD所有
>stocks.loc[(['BIDU', 'JD'], '2019-10-03'), '收盘']		# BIDU,JD指定日期收盘价格
>
># slice(None)代表筛选这一索引的所有内容
>stocks.loc[(slice(None), ['2019-10-02', '2019-10-03']), :]
>stocks.reset_index()
>```

### 数据转换函数map、apply、applymap

1. map：只用于Series，实现每个值->值的映射；
2. apply：用于Series实现每个值的处理，用于Dataframe实现某个轴的Series的处理；
3. applymap：只能用于DataFrame，用于处理该DataFrame的每个元素；

#### map用于Series值的转换

将股票代码英文转换成中文名字

Series.map(dict) or Series.map(function)均可

>演示：用户对电影评分的归一化
>
>每个用户的评分不同，有的乐观派评分高，有的悲观派评分低，按用户做归一化
>
>```
>import pandas as pd
>ratings = pd.read_csv(
>    "./datas/movielens-1m/ratings.dat", 
>    sep="::",
>    engine='python', 
>    names="UserID::MovieID::Rating::Timestamp".split("::")
>)
>ratings.head()
>
># 实现按照用户ID分组，然后对其中一列归一化
>def ratings_norm(df):
>    """
>    @param df：每个用户分组的dataframe
>    """
>    min_value = df["Rating"].min()
>    max_value = df["Rating"].max()
>    df["Rating_norm"] = df["Rating"].apply(
>        lambda x: (x-min_value)/(max_value-min_value))
>    return df
>
>ratings = ratings.groupby("UserID").apply(ratings_norm)
>ratings[ratings["UserID"]==1].head()
>```
>
>![](https://github.com/Lichee-cpu/images/raw/master/images/images20210528220013.png)

#### 每个分组的TOPN数据

获取2018年每个月温度最高的2天数据

> ```
> fpath = "./datas/beijing_tianqi/beijing_tianqi_2018.csv"
> df = pd.read_csv(fpath)
> # 替换掉温度的后缀℃
> df.loc[:, "bWendu"] = df["bWendu"].str.replace("℃", "").astype('int32')
> df.loc[:, "yWendu"] = df["yWendu"].str.replace("℃", "").astype('int32')
> # 新增一列为月份
> df['month'] = df['ymd'].str[:7]
> df.head()
> 
> def getWenduTopN(df, topn):
>     """
>     这里的df，是每个月份分组group的df
>     """
>     return df.sort_values(by="bWendu")[["ymd", "bWendu"]][-topn:]
> 
> df.groupby("month").apply(getWenduTopN, topn=1).head()
> ```
>
> ![](https://github.com/Lichee-cpu/images/raw/master/images/images20210528220325.png)
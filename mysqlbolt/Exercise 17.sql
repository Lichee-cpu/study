# 添加列

-- 添加一个名为Aspect_ratio的列，其数据类型为FLOAT，用于存储每个电影发布时的纵横比。
ALTER TABLE movies
ADD aspect_ratio FLOAT;

-- 添加另一个名为Language的列，其数据类型为TEXT，用于存储电影发布时使用的语言。确保此语言的默认是英语。
ALTER TABLE movies
ADD language TEXT
    DEFAULT 'English';
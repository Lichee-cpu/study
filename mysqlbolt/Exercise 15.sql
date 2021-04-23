-- 这个数据库太大了，让我们删除所有在2005年之前发布的电影。
DELETE FROM movies
WHERE year < 2005;

-- 安德鲁·斯坦顿(Andrew Stanton)离开了电影公司，所以请删掉他执导的所有电影
DELETE FROM movies
WHERE director = 'Andrew Stanton';
-- 列出所有Pixar电影的导演(按字母顺序)，不要重复
select distinct director from movies order by   director asc;
-- 列出Pixar最近发行的四部电影(按最近到最少排序)
select * from movies order by year desc limit 4;
-- 按字母顺序列出前五部Pixar电影
select * from movies order by title asc limit 5;
-- 按字母顺序列出接下来的五部Pixar电影
select * from movies order by title asc limit 5 OFFSET  5;


# distinct去除重复项
# order by 排序
# limit 限制返回的行数
# offset 从何处开始计算行数
# desc 降序 asc 升序

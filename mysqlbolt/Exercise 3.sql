-- 找到所有的Toy Story电影
select * from movies where title like "%Toy Story%";
-- 找出John Lasseter导演的所有电影
select * from movies where director="John Lasseter";
-- 找出所有不是John Lasseter导演的电影(和导演)
select * from movies where director!="John Lasseter";
-- 找到所有的WALL-*电影
select * from movies where title like "WALL-%";
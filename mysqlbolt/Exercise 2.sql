/* Exercise 2 */
-- 找到行id为6的电影
select * from movies where id=6;
-- 找出2000年到2010年间上映的电影
select * from movies where year between 2000 and 2010;
-- 找出2000年到2010年间未上映的电影
select * from movies where year not between 2000 and 2010;
-- 找出Pixar的前5部电影和它们的发行年份
select * from movies where id between 1 and 5;
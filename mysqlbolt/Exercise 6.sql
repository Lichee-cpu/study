-- 查找每一部电影的国内和国际销售情况
select title, domestic_sales, international_sales
from movies 
join boxoffice
on movies.id = boxoffice.Movie_id;

-- 显示每一部在国际市场上比在国内表现更好的电影的销售数字
select *
from movies
inner join boxoffice
on movies.id=boxoffice.Movie_id
where international_sales > domestic_sales;

-- 把所有的电影按排名从高到低排列出来
select * 
from movies
inner join boxoffice
on movies.id = boxoffice.Movie_id
order by rating desc;
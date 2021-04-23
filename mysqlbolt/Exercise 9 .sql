-- 以百万美元为单位列出所有电影和它们的总销售额
SELECT
	title,
	(domestic_sales + international_sales)/1000000 AS sales
FROM boxoffice AS b
INNER JOIN movies AS m
	ON m.id = b.movie_id;
	
-- 列出所有电影和他们的百分比的评级
SELECT
	title,
	rating*10 AS ratings_percent
FROM boxoffice AS b
INNER JOIN movies AS m
	ON m.id = b.movie_id;
	
-- 列出所有在偶数年发行的电影
SELECT title,year
FROM boxoffice AS b
INNER JOIN movies AS m
	ON m.id = b.movie_id
WHERE year % 2 = 0
ORDER BY year ASC;
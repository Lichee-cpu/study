-- 找出每位导演执导的电影数量
SELECT COUNT(*),Director 
FROM movies
GROUP BY Director;

-- 找出可归属于每位主管的国内及国际总销售额
SELECT
    director,
    SUM(domestic_sales + international_sales) AS total_sales 
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
GROUP BY director;
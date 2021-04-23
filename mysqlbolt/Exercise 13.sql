-- 添加该公司的新作品《玩具总动员4》(你可以用任何导演)
INSERT INTO movies
    (title, director, year, length_minutes)
VALUES
    ('Toy Story 4', 'Lance Lafontaine', 2021, 168);
		
-- 《玩具总动员4》已经发行并获得了评论界的好评!该片的票房评分为8.7分，国内票房3.4亿美元，国际票房2.7亿美元。将该记录添加到BoxOffice表中。
INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES
    (15, 8.7, 340000000, 270000000);
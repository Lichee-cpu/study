-- 《A Bug's Life》的导演是错误的，它实际上是由John Lasseter导演的
UPDATE movies
SET director = "John Lasseter"
WHERE title = "A Bug's Life";

-- 《Toy Story 2 》发行的年份不正确，它实际上是在1999年发行的
UPDATE movies
SET year = "1999"
WHERE title = "Toy Story 2";

-- 《Toy Story 8》的片名和导演都不对!片名应该是《Toy Story 3》，由Lee Unkrich执导
UPDATE movies
SET
    title = 'Toy Story 3',
    director = 'Lee Unkrich'
WHERE id = (
    SELECT id
    FROM movies
    WHERE title = 'Toy Story 8'
); 
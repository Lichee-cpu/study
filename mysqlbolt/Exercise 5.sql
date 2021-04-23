-- 列出所有的加拿大城市和他们的人口
select city, population 
from north_american_cities 
where Country="Canada";

-- 把美国所有的城市按纬度从北到南排序
select * 
from north_american_cities
where country = "United States" 
order by  latitude desc;

-- 列出芝加哥以西的所有城市，从西向东排序
select city 
from north_american_cities 
where longitude < 
(select longitude from north_american_cities where city = "Chicago") 
order by longitude asc;

-- 墨西哥最大的两个城市(按人口分列)
select city 
from north_american_cities 
where country = "Mexico"  
order by population desc 
limit 2;

-- 列出美国第三大城市和第四大城市(按人口)及其人口
select city,population 
from north_american_cities 
where country = "United States" 
order by population desc 
limit 2 offset 2;
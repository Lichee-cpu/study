-- 找出员工在工作室待的最长时间
SELECT MAX(years_employed) as longest_years
FROM employees;

-- 对于每个角色，找到该角色中雇员的平均雇佣年限
SELECT role,AVG(years_employed)AS average_years_employed
FROM employees
GROUP BY role;

-- 找出在每幢大楼工作的员工年总数
SELECT building,SUM(years_employed)AS sum_of_years_employed
FROM employees
GROUP BY building;
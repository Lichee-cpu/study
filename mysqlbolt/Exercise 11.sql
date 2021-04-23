-- 找到工作室中的美工人数(没有HAVING条款)
SELECT COUNT(role)
FROM employees
WHERE role = 'Artist';

-- 查找工作室中每个角色的雇员数量
SELECT role,
    COUNT(name) AS number_of_employees
FROM employees
GROUP BY role;

-- 找出所有工程师雇佣的总年数
SELECT
	role,
	SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer";
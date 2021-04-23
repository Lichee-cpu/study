-- 查找尚未分配到某一大楼的所有员工的姓名和角色
SELECT *
FROM employees
LEFT JOIN buildings
	ON employees.building = buildings.building_name
WHERE building_name IS NULL;

-- 找出没有员工的大楼的名字
SELECT *
FROM buildings
LEFT JOIN employees
	ON buildings.building_name = employees.building
WHERE role IS NULL;
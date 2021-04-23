-- 找到所有有员工的大楼名单
select distinct building_name from buildings
left join employees
on buildings.Building_name = employees.building
where building is not null;

-- 找到所有建筑的名单和容量
select * from buildings;

-- 列出所有建筑和每个建筑中不同的员工角色(包括空建筑)
select distinct building_name,role from buildings
left join employees
on buildings.Building_name = employees.building
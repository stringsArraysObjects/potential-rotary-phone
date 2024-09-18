-- For this challenge you need to create a
--     simple HAVING statement, you want to count
--     how many people have the same age and return
--     the groups with 10 or more people who have that age.

-- people table schema
-- id
-- name
-- age

-- return table schema
-- age
-- total_people

-- EXAMPLE:
-- age	total_people
-- 80	14
-- 54	12
-- 47	13
-- 46	11
-- 99	17
-- 48	14
-- 94	10


select age, count(*) as total_people
from people
group by age
having count(*) >= 10
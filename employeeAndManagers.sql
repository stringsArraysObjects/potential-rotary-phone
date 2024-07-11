-- You have been provided with a PostgreSQL database that contains an employees table. The employees table has the following structure:

-- id: an integer column that uniquely identifies each employee.
-- name: a text column that contains the name of the employee.
-- manager_id: an integer column that identifies the manager of each employee. The manager_id corresponds to an id in the same employees table. This means that our table has a recursive relationship with itself - an employee can be a manager to other employees. It is nullable: top managers do not have managers above them.
-- Your task is to write a SQL query that meets the following requirements:

-- The query should output a list of all managers and their respective employees, grouped by the manager_id.
-- The output of your query should be a table with two columns:
-- manager_id: ID of each manager.
-- employee_names: an array of all the names of employees who have that manager. Each entry in the array should be a string of the form employee_name (employee_id). The employees in each array should be ordered by their id in ascending order.
-- We should avoid displaying null for manager_id colummn in the result set.
-- The output rows should be ordered by manager_id in ascending order.
-- Example:
-- manager_id	employee_names
-- 1	{"Mrs. Kareem Kuphal (4)","Oretha Borer PhD (7)","Emory Koss (10)","Joanie Jast (13)","Eilene Conroy (16)","Tyler Flatley (19)","Antone Kulas (22)"}
-- 2	{"Mandie Morar (5)","Vincent Dicki (8)","Mathilda Feil (11)","Hue Haag (14)","Rep. Melinda Schroeder (17)","Kerstin Daugherty II (20)","Claudette Volkman (23)"}
-- 3	{"Talia Cormier I (6)","Doreatha Lebsack (9)","The Hon. Teddy Wunsch (12)","Meghan Labadie (15)","Bettye Pouros V (18)","Fairy Daugherty MD (21)","Tomas Rosenbaum (24)"}
-- 5	{"Rod Pacocha (27)","Vivien Heaney (70)","Elisa Schamberger (71)","Marlys Mitchell Ret. (81)"}
-- 6	{"Shannon Bayer (97)"}
-- 7	{"Simon Batz (35)","Marlo Mann IV (52)","Bill Herzog V (54)","Tanna Bartell (96)"}


select manager_id, array_agg(concat(name, ' (', id, ')') order by id) employee_names
from employees
where manager_id is not null
group by manager_id
order by 1
-- Write an SQL query that identifies how many
-- employees joined and left ABC Kata Solutions each year, 
-- from 2014 through 2023. The query should produce a list 
-- of years from 2014 to 2023 along with two counts for each year. 
-- The result set should have 3 colums:
-- 1.year: The year being reported.
-- 2.joined_quantity: The number of employees who joined ABC Kata Solutions. 
--     Refers to the total number of employees whose joined_date falls within the 
--     specific calendar year.
-- 3.left_quantity: The number of employees who left ABC Kata Solutions. Refers 
--   to the total number of employees whose left_date falls within the specific calendar
--   year, indicating they have left the company.



select year,
  count(*) filter (where extract(year from joined_date) = year) as joined_quantity,
  count(*) filter (where extract(year from left_date) = year) as left_quantity
from generate_series(2014, 2023) year, employees
group by year
order by year
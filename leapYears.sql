-- PARAMETERS: Table years has two columns: id, and year.
          
-- RESULT   Your query has to return rows with two columns: year, and is_leap.
            -- Returned rows have to be sorted ascending by the year.
-- EXAMPLE  Years divisible by 4 are leap years,
            -- but years divisible by 100 are not leap years,
            -- but years divisible by 400 are leap years.
SELECT year,
       CASE WHEN (year % 4 = 0 AND year % 100 <> 0) OR (year % 400 = 0) THEN true
             ELSE false
       END AS is_leap
FROM years order by year;

select
  year,
  case
    when year%400=0 then true
    when year%100=0 then false
    when year%4=0 then true
    else false
  end as is_leap
from years
order by year;
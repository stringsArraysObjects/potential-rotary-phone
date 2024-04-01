
SELECT year,
       CASE WHEN (year % 4 = 0 AND year % 100 <> 0) OR (year % 400 = 0) THEN true
             ELSE false
       END AS is_leap
FROM years order by year;
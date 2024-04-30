-- PARAMETERS:table 'otherangle' with columns 'a' and 'b'
-- RESULT:    given two interior angles (in degrees) of a triangle. 
--            Write an SQL statement to return the 3rd angle result in column res.

select
a,
b,
180 - (a+b) as res

from otherangle


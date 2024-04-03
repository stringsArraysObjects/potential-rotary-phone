-- Given film_actor and film tables from the DVD Rental sample database 
-- find all movies both Sidney Crowe (actor_id = 105) and Salma Nolte (actor_id = 122)
-- cast in together and order the result set alphabetically.

SELECT f.title
FROM film f
JOIN film_actor fa on fa.film_id = f.film_id
WHERE fa.actor_id IN (105,122)
GROUP BY f.film_id
HAVING COUNT(*) = 2
ORDER BY f.title ASC

-- Replace with your SQL Query
SELECT film.title
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
WHERE film_actor.actor_id IN (105, 122)
GROUP BY film.title
HAVING COUNT(*) = 2
ORDER BY film.title ASC;

SELECT f.title 
  FROM film f 
  INNER JOIN film_actor a ON f.film_id = a.film_id
  INNER JOIN film_actor b ON f.film_id = b.film_id
  WHERE a.actor_id = 105 AND b.actor_id = 122
  ORDER BY title;
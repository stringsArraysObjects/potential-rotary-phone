-- users table:

-- Columns: id, name
-- Primary key: id
-- products table:

-- Columns: id, product_name
-- Primary key: id
-- orders table:

-- Columns: id, user_id, product_id
-- Primary key: id
-- Foreign keys: user_id references users(id), product_id references products(id)
-- In this kata, we need to find out the names and IDs of all users who ordered every available product at least once. The result should be ordered by user_id in descending order.



SELECT orders.user_id, users.name 
FROM orders LEFT JOIN users ON orders.user_id = users.id  
GROUP BY orders.user_id, users.name  
HAVING COUNT(product_id)>1  
ORDER BY orders.user_id DESC

select user_id, name
from users join orders on user_id = users.id
group by user_id, name
having count(distinct product_id) = (select count(*) from products)
order by user_id desc
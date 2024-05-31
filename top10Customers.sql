-- RESULT: generate a simple report that returns the top 10 customers by 
--         total amount spent ordered from highest to lowest. 
--         Total number of payments has also been requested.







SELECT c.customer_id, SUM(CAST(p.amount as float)) AS total_amount,
c.email, COUNT(p.amount) AS payments_count
FROM customer c INNER JOIN payment p ON c.customer_id=p.customer_id
GROUP BY c.customer_id
ORDER BY total_amount desc
LIMIT 10;

SELECT
  customer.customer_id,
  customer.email,
  COUNT(payment.payment_id) AS payments_count,
  CAST(SUM(payment.amount) AS float) AS total_amount
FROM customer
JOIN payment
  ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id
ORDER BY total_amount DESC
LIMIT 10
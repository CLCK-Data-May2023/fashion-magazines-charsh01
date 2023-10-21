
WITH unpaid AS (
SELECT *
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_status = 'unpaid'),

balance AS (
SELECT *
FROM unpaid
JOIN subscriptions
ON subscriptions.subscription_id = unpaid.subscription_id)

SELECT customer_name AS "Customer", printf('$%.2f', price_per_month*subscription_length) AS "Amount Due"
FROM balance;



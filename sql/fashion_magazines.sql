WITH unpaid AS (
SELECT *
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE order_status = 'unpaid'),

owed AS (
SELECT *
FROM unpaid
JOIN subscriptions
ON subscriptions.subscription_id = unpaid.subscription_id
WHERE "description" = 'Fashion Magazine')

SELECT customer_name AS Customer, printf('$%.2f',SUM(price_per_month*subscription_length)) AS "Amount Due"
FROM owed
GROUP BY Customer;

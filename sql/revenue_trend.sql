/*
This query calculates monthly e-commerce performance over the last 12 months.
It aggregates key metrics, including total revenue, number of orders, number of users,
items sold, and average order value (AOV).
The data is grouped by month to identify trends and performance evolution over time.
*/

SELECT
  DATE_TRUNC(DATE(o.created_at), MONTH) AS month_date,
  COUNT(DISTINCT o.order_id) AS orders,
  COUNT(DISTINCT o.user_id) AS users,
  SUM(oi.sale_price) AS revenue,
  COUNT(oi.id) AS items_sold,
  SUM(oi.sale_price) / COUNT(DISTINCT o.order_id) AS avg_order_value
FROM `bigquery-public-data.thelook_ecommerce.orders` o
JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
ON o.order_id = oi.order_id
WHERE DATE(o.created_at) >= DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)
GROUP BY month_date
ORDER BY month_date;

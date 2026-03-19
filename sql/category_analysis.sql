/*
This query analyses revenue performance by product category.
It aggregates total revenue and the number of items sold for each category, allowing comparison of which categories contribute the most to overall sales.
The results are ordered by revenue to highlight top-performing categories.
*/

SELECT
  p.category,
  SUM(oi.sale_price) AS revenue,
  COUNT(oi.id) AS items_sold
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
WHERE DATE(oi.created_at) >= DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)
GROUP BY p.category
ORDER BY revenue DESC

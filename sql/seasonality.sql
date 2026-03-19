/*
This query identifies the top-performing products by season over the last 12 months.
It classifies each transaction by season (Winter, Spring, Summer, Fall) based on the order date, then aggregates revenue and items sold by product. 
A ranking function is used to extract the top 5 products per season, enabling analysis of seasonal patterns and marketing opportunities.
*/

WITH base AS (
  SELECT
    CASE
      WHEN EXTRACT(MONTH FROM oi.created_at) IN (12,1,2) THEN 'Winter'
      WHEN EXTRACT(MONTH FROM oi.created_at) IN (3,4,5) THEN 'Spring'
      WHEN EXTRACT(MONTH FROM oi.created_at) IN (6,7,8) THEN 'Summer'
      ELSE 'Fall'
    END AS season,
    p.name AS product_name,
    p.category,
    SUM(oi.sale_price) AS revenue,
    COUNT(oi.id) AS items_sold
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` p
    ON oi.product_id = p.id
  WHERE DATE(oi.created_at) >= DATE_SUB(CURRENT_DATE(), INTERVAL 12 MONTH)
  GROUP BY season, product_name, p.category
)

SELECT *
FROM (
  SELECT
    *,
    ROW_NUMBER() OVER (
      PARTITION BY season
      ORDER BY revenue DESC
    ) AS rank
  FROM base
)
WHERE rank <= 5
ORDER BY season, revenue DESC

# 📊 E-commerce Performance Analysis (SQL + Looker Studio)

## 🧠 Project Overview

This project analyses e-commerce performance using SQL (BigQuery) and Looker Studio to identify key revenue drivers, category performance, and seasonal trends.

The goal is to simulate a real-world scenario in which data is used to support marketing decisions and optimise revenue.
## 🎯 Business Questions

This analysis focuses on answering the following key questions:

1. How has revenue evolved over the last 12 months?
2. Which product categories generate the most revenue?
3. What are the top-performing products by season, and how can this inform marketing strategies?

## 🧰 Tools & Technologies

- Google BigQuery (SQL)
- Looker Studio
- Public dataset: theLook eCommerce
  
## 📂 Data Source

The analysis uses the **theLook eCommerce dataset**, which includes:

- `orders`: order-level information  
- `order_items`: product-level transactions  
- `products`: product details and categories  

These tables were combined to create a complete view of sales performance and product behaviour.

## ⚙️ Data Processing (SQL)

The data was extracted and transformed using SQL in BigQuery. Key steps included:

- Joining multiple tables (`orders`, `order_items`, `products`)
- Aggregating revenue, orders, and user metrics
- Filtering data for the last 12 months
- Creating calculated fields such as **season**
- Using window functions to rank top-performing products by season

All queries are available in the `/sql` folder.

## 📈 Key Insights

- Revenue shows steady growth, with stronger performance in recent months, suggesting potential seasonal demand.
- Outerwear & Coats is the top-performing category, indicating strong demand for high-value products.
- Outerwear products consistently rank among top performers across all seasons, indicating that demand extends beyond traditional winter periods and supporting always-on marketing strategies.

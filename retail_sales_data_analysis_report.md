
# Retail Sales Data Analysis Report

---

## Business Problem 1: Top Product Categories by Profit Margin

**Problem statement:**  
Which product categories generate the highest profit margins and how do they compare in revenue and sales volume?

---

**SQL Query:**

```sql
SELECT
    category,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    ROUND(SUM(cogs)::numeric, 2) AS total_cogs,
    ROUND(SUM(total_sale - cogs)::numeric, 2) AS total_profit,
    ROUND(
      ((SUM(total_sale - cogs)::numeric / NULLIF(SUM(total_sale)::numeric, 0)) * 100),
      2
    ) AS profit_margin_pct,
    COUNT(*) AS num_transactions
FROM retail_sales
GROUP BY category
ORDER BY profit_margin_pct DESC;
```

---

**Results Summary:**  
Beauty, Clothing, and Electronics categories all have very high profit margins (around 79%) with Electronics leading in total revenue.

---

**Insights:**  
These categories are key drivers of profitability. Beauty's exceptionally high margin suggests strong pricing or low cost, while Electronics drives high revenue with a slightly lower margin.

---

**Recommendations:**  
Focus marketing and inventory efforts on these categories. Consider bundling or cross-promoting these high-margin products to increase average transaction value.

---

## Business Problem 2: Revenue & Transaction Trends by Month (Example)

**Problem statement:**  
How does total revenue, number of transactions, and average transaction value vary by month?

---

**SQL Query:**

```sql
SELECT
    EXTRACT(MONTH FROM sale_date) AS sale_month,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    COUNT(*) AS num_transactions,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_transaction_value
FROM retail_sales
GROUP BY sale_month
ORDER BY sale_month;
```

---

**Results Summary:**  
Sales revenue and number of transactions spike in November and December, reflecting seasonal buying trends, while average transaction value remains steady.

---

**Insights:**  
Seasonal spikes indicate holiday shopping periods, suggesting times for targeted promotions and increased inventory.

---

**Recommendations:**  
Plan marketing campaigns and stock levels to capitalize on peak months. Use steady average transaction value to forecast revenue reliably.

---

## Business Problem 3: Customer Segment Analysis (Example)

**Problem statement:**  
Which customer age group and gender contribute the highest total revenue?

---

**SQL Query:**

```sql
SELECT
    age,
    gender,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    COUNT(*) AS num_transactions
FROM retail_sales
GROUP BY age, gender
ORDER BY total_revenue DESC
LIMIT 5;
```

---

**Results Summary:**  
The 46-55 age group and female customers contribute the highest total revenue.

---

**Insights:**  
This segment likely has more disposable income and brand loyalty, driving substantial revenue.

---

**Recommendations:**  
Target marketing campaigns and product offerings to females aged 46-55 for better engagement and higher sales.

---

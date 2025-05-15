--Which product categories generate the most revenue, and are there seasonal patterns?

SELECT 
    category,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_sale_per_transaction,
    COUNT(*) AS num_transactions
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

SELECT 
    DATE_TRUNC('month', sale_date) AS month,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    COUNT(*) AS num_transactions,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_transaction_value
FROM retail_sales
WHERE category = 'Electronics'
GROUP BY month
ORDER BY month;
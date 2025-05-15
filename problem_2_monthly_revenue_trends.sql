--Which customer groups (by age or gender) bring in the most revenue, and how do they behave?

SELECT 
    CASE 
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        WHEN age > 55 THEN '56+'
        ELSE 'Unknown'
    END AS age_group,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    COUNT(*) AS num_transactions,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_transaction_value
FROM retail_sales
GROUP BY age_group
ORDER BY total_revenue DESC;

SELECT 
    gender,
    ROUND(SUM(total_sale)::numeric, 2) AS total_revenue,
    COUNT(*) AS num_transactions,
    ROUND(AVG(total_sale)::numeric, 2) AS avg_transaction_value
FROM retail_sales
GROUP BY gender
ORDER BY total_revenue DESC;

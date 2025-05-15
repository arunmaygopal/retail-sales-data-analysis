--Beyond revenue, which product categories give us the highest profit margins, and which might be dragging profitability down?

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

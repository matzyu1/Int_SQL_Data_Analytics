SELECT
    cohort_year,
    COUNT(DISTINCT customer_id) AS customers_count,
    SUM(revenue) AS total_revenue,
    ROUND(SUM(revenue) / COUNT(DISTINCT customer_id), 2) AS revenue_per_customer
FROM customer_base  
WHERE invoice_date = first_purchase_date
GROUP BY cohort_year
ORDER BY cohort_year;

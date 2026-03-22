WITH customer_ltv AS (
    SELECT
        customer_id,
        SUM(revenue) AS total_ltv
    FROM customer_base
    GROUP BY customer_id
), percentiles AS (
    SELECT
        PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY total_ltv) AS p25,
        PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY total_ltv) AS p75
    FROM customer_ltv
), segment_values AS (
    SELECT
        c.customer_id,
        c.total_ltv,
        CASE
            WHEN c.total_ltv <= p.p25 THEN '1-Low Value'
            WHEN c.total_ltv <= p.p75 THEN '2-Medium Value'
            ELSE '3-High Value'
        END AS customer_segment
    FROM customer_ltv c
    CROSS JOIN percentiles p
)
SELECT 
    customer_id,
    total_ltv,
    customer_segment,
    ROUND(SUM(total_ltv) OVER (PARTITION BY customer_segment), 2) AS total_ltv_by_segment,
    ROUND(AVG(total_ltv) OVER (PARTITION BY customer_segment), 2) AS avg_ltv_by_segment,
    COUNT(customer_id) OVER (PARTITION BY customer_segment) AS count_by_segment
FROM segment_values
WITH last_purchase AS (
    SELECT
        customer_id,
        cohort_year,
        MAX(invoice_date) AS last_purchase_date,
        MIN(invoice_date) AS first_purchase_date
    FROM customer_base
    GROUP BY customer_id, cohort_year
),
churn_flag AS (
    SELECT *,
        CASE
            WHEN last_purchase_date < (SELECT MAX(invoice_date) FROM customer_base) - INTERVAL '6 months'
            THEN 'Churned'
            ELSE 'Active'
        END AS status
    FROM last_purchase
)
SELECT
    status,
    cohort_year,
    COUNT(customer_id) AS customers,
    ROUND(COUNT(customer_id)::numeric / SUM(COUNT(customer_id)) OVER (PARTITION BY cohort_year), 2) AS percentage
FROM churn_flag
GROUP BY 
    status, cohort_year
ORDER BY cohort_year;
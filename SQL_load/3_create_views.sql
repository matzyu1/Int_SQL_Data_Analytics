CREATE OR REPLACE VIEW clean_ecom_uk AS
SELECT
    invoice_no,
    stockcode,
    description,
    quantity,
    TO_TIMESTAMP(invoice_date, 'MM/DD/YYYY HH24:MI')::DATE AS invoice_date,
    unit_price,
    customer_id,
    country
FROM ecom_uk
WHERE customer_id IS NOT NULL
  AND quantity > 0
  AND unit_price > 0;

CREATE OR REPLACE VIEW customer_base AS
WITH customer_orders AS (
  SELECT
      customer_id,
      invoice_date AS invoice_date,
      COUNT(DISTINCT invoice_no) AS total_orders,
      SUM(quantity * unit_price) AS revenue,
      MAX(country) AS country
  FROM clean_ecom_uk
  GROUP BY customer_id, invoice_date
)
SELECT
    customer_id,
    invoice_date,
    total_orders,
    country,
    revenue,
    MIN(invoice_date) OVER (PARTITION BY customer_id) AS first_purchase_date,
    EXTRACT(YEAR FROM MIN(invoice_date) OVER (PARTITION BY customer_id)) AS cohort_year
FROM customer_orders;


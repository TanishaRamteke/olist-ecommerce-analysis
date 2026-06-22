
SELECT
  COUNT(DISTINCT order_id) AS total_orders,
  COUNT(DISTINCT customer_unique_id) AS unique_customers,
  ROUND(SUM(payment_value)::numeric, 2) AS total_revenue,
  ROUND(AVG(payment_value)::numeric, 2) AS avg_order_value,
  ROUND(AVG(review_score)::numeric, 2)  AS avg_review_score
FROM orders;


SELECT 
  order_month,
  ROUND(SUM(payment_value)::numeric, 2) AS revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders 
GROUP BY order_month 
ORDER BY order_month;

SELECT
  ROUND(100.0 * SUM(CASE WHEN frequency > 1 THEN 1 ELSE 0 END)
        / COUNT(*), 1) AS repeat_rate_pct,
  SUM(CASE WHEN frequency > 1 THEN 1 ELSE 0 END) AS repeat_customers,
  COUNT(*) AS total_customers
FROM rfm_segments;


SELECT segment,
  COUNT(*) AS customers,
  ROUND(AVG(monetary)::numeric, 2) AS avg_revenue,
  ROUND(SUM(monetary)::numeric, 2) AS total_revenue
FROM rfm_segments
GROUP BY segment 
ORDER BY total_revenue DESC;


SELECT customer_state,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(payment_value)::numeric, 2) AS revenue
FROM orders 
GROUP BY customer_state
ORDER BY revenue DESC 
LIMIT 5;


SELECT 
  late_delivery,
  COUNT(*) AS orders,
  ROUND(AVG(review_score)::numeric, 2) AS avg_review
FROM orders 
GROUP BY late_delivery
ORDER BY late_delivery;


SELECT product_category_name_english AS category,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(payment_value)::numeric, 2) AS revenue,
  ROUND(AVG(review_score)::numeric, 2) AS avg_review
FROM orders 
WHERE product_category_name_english IS NOT NULL
GROUP BY category 
ORDER BY revenue DESC 
LIMIT 10;


SELECT payment_type,
  COUNT(*) AS transactions,
  ROUND(SUM(payment_value)::numeric, 2) AS total_value,
  ROUND(AVG(payment_value)::numeric, 2) AS avg_value
FROM orders 
GROUP BY payment_type 
ORDER BY total_value DESC;
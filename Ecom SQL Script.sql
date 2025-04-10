-- Q1 Customer purchase trend Year-On-Year
SELECT month AS month_no,
    CASE
        WHEN a.month = '1' THEN 'Jan'
        WHEN a.month = '2' THEN 'Feb'
        WHEN a.month = '3' THEN 'Mar'
        WHEN a.month = '4' THEN 'Apr'
        WHEN a.month = '5' THEN 'May'
        WHEN a.month = '6' THEN 'Jun'
        WHEN a.month = '7' THEN 'Jul'
        WHEN a.month = '8' THEN 'Aug'
        WHEN a.month = '9' THEN 'Sep'
        WHEN a.month = '10' THEN 'Oct'
        WHEN a.month = '11' THEN 'Nov'
        WHEN a.month = '12' THEN 'Dec'
        ELSE to_char(a.month, '999')
    END AS month,
    SUM(
        CASE
            WHEN a.year = '2016' THEN 1
            ELSE 0
        END
    ) AS Year2016,
    SUM(
        CASE
            WHEN a.year = '2017' THEN 1
            ELSE 0
        END
    ) AS Year2017,
    SUM(
        CASE
            WHEN a.year = '2018' THEN 1
            ELSE 0
        END
    ) AS Year2018
FROM (
        SELECT customer_id,
            order_id,
            order_delivered_customer_date,
            order_status,
            date_part('year', order_delivered_customer_date) AS Year,
            date_part('month', order_delivered_customer_date) AS month
        FROM orders
        WHERE order_status = 'delivered'
            and order_delivered_customer_date is not null
        GROUP BY customer_id,
            order_id,
            order_delivered_customer_date,
            order_status
        ORDER BY order_delivered_customer_date ASC
    ) a
GROUP BY month
ORDER BY month_no ASC

-- Q2 Top 10 Cities with highest revenue FROM 2016 to 2018

WITH raw_data AS (
    SELECT DISTINCT c.customer_id,
        o.order_id,
        p.payment_value,
        o.order_status
    FROM customers c
        JOIN orders o ON c.customer_id = o.customer_id
        JOIN order_payments p ON p.order_id = o.order_id
    WHERE o.order_status = 'delivered'
)

SELECT customer_city,
    customer_state,
    COUNT(DISTINCT raw.order_id) as Total_orders,
    SUM(raw.payment_value) AS Total_payments
FROM customers c
    JOIN raw_data raw ON c.customer_id = raw.customer_id
GROUP BY 1,
    2
ORDER BY 4 DESC
LIMIT 10

-- Q3 Extract payment value in a day and month
SELECT date_trunc('day', o.order_purchase_timestamp) AS date_purchase,
    SUM(p.payment_value) AS total_value,
    COUNT(p.order_id) AS total_order
FROM orders o
    LEFT JOIN order_payments p ON o.order_id = p.order_id
GROUP BY 1
ORDER BY 1 ASC

WITH raw AS(
    SELECT date_trunc('day', o.order_purchase_timestamp) AS date_purchase,
        SUM(p.payment_value) AS total_value,
        COUNT(p.order_id) AS total_order
    FROM orders o
        LEFT JOIN order_payments p ON o.order_id = p.order_id
    GROUP BY 1
    ORDER BY 1 ASC
)

SELECT *
FROM raw
WHERE total_value IS NOT NULL
SELECT date_trunc('month', o.order_purchase_timestamp) AS date_purchase,
    SUM(p.payment_value) AS total_value,
    COUNT(p.order_id) AS total_order
FROM orders o
    LEFT JOIN order_payments p ON o.order_id = p.order_id
GROUP BY 1
ORDER BY 1 ASC


-- Q4 Average review score by month
SELECT date_trunc('month', o.order_purchase_timestamp) AS date_purchase,
    AVG(r.review_score) AS average_score
FROM orders o
    LEFT JOIN order_reviews r ON o.order_id = r.order_id
GROUP BY 1
ORDER BY 1 ASC

-- Q5 Customer only use boleto payment_type
WITH raw AS (
    SELECT DISTINCT c.customer_unique_id
    FROM customers c
        LEFT JOIN orders o ON c.customer_id = o.customer_id
        LEFT JOIN order_payments p ON p.order_id = o.order_id
    WHERE p.payment_type = 'boleto'
),
raw2 AS (
    SELECT DISTINCT c.customer_unique_id
    FROM customers c
        LEFT JOIN orders o ON c.customer_id = o.customer_id
        LEFT JOIN order_payments p ON p.order_id = o.order_id
    WHERE p.payment_type <> 'boleto'
)
SELECT *
FROM raw
WHERE NOT EXISTS (
        SELECT *
        FROM raw2
        WHERE raw.customer_unique_id = raw2.customer_unique_id
    )

-- Q6 Top average review score by category
SELECT c.product_category_name_english,
    AVG(r.review_score) AS average_score
FROM product_category_name_translatiON c
    JOIN products p ON c.product_category_name = p.product_category_name
    JOIN order_items i ON p.product_id = i.product_id
    JOIN order_reviews r ON i.order_id = r.order_id
GROUP BY 1
ORDER BY 2 DESC

-- Q7 TOP payment_value by category 
SELECT p2.product_category_name_english,
    SUM(o.payment_value) AS total_value
FROM products p
    LEFT JOIN order_items i ON i.product_id = p.product_id
    LEFT JOIN order_payments o ON i.order_id = o.order_id
    LEFT JOIN product_category_name_translatiON p2 ON p.product_category_name = p2.product_category_name
GROUP BY 1
ORDER BY 2 DESC


-- Q9 Seller sold the most product and number of product
SELECT o.product_id,
    o.seller_id,
    pc.product_category_name_english,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    COUNT (DISTINCT o.order_id) AS number_order
FROM order_items o
    JOIN products p ON o.product_id = p.product_id
    JOIN product_category_name_translation pc ON p.product_category_name = pc.product_category_name
    JOIN sellers s ON o.seller_id = s.seller_id
GROUP BY 1,2,3,4,5,6
ORDER BY 7 DESC
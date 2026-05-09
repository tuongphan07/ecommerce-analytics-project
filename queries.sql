SELECT *
FROM orders;

SELECT *
FROM orders
LIMIT 10;

SELECT COUNT(*)
FROM orders;


SELECT Country,
       COUNT(*) AS total_orders
FROM orders
GROUP BY Country
ORDER BY total_orders DESC
LIMIT 10;



SELECT Description,
       SUM(Quantity) AS total_quantity_sold
FROM orders
GROUP BY Description
ORDER BY total_quantity_sold DESC
LIMIT 10;

SELECT Description,
       SUM(Quantity * UnitPrice) AS revenue
FROM orders
GROUP BY Description
ORDER BY revenue DESC
LIMIT 10;


SELECT ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue
FROM orders;



SELECT CustomerID,
       ROUND(SUM(Quantity * UnitPrice), 2) AS total_spent
FROM orders
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;

SELECT ROUND(
    SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo),
    2
) AS average_order_value
FROM orders;


SELECT 
    SUBSTR(InvoiceDate, 4, 7) AS month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS monthly_revenue
FROM orders
GROUP BY month
ORDER BY monthly_revenue DESC;



SELECT *
FROM orders
WHERE CustomerID IS NULL;



SELECT 
    COUNT(*) AS missing_customer_rows,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS missing_customer_percent
FROM orders
WHERE CustomerID IS NULL;


SELECT *
FROM orders
WHERE Quantity < 0;



SELECT COUNT(DISTINCT InvoiceNo) AS cancelled_orders
FROM orders
WHERE InvoiceNo LIKE 'C%';



SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM orders
WHERE Quantity > 0
GROUP BY Country
ORDER BY revenue DESC
LIMIT 10;



SELECT
    SUBSTR(InvoiceDate, 4, 7) AS month,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue
FROM orders
WHERE Quantity > 0
GROUP BY month
ORDER BY month;


SELECT
    SUBSTR(InvoiceDate, 8, 4) || '-' ||
    
    CASE
        WHEN LENGTH(SUBSTR(InvoiceDate, 1, INSTR(InvoiceDate, '/') - 1)) = 1
        THEN '0' || SUBSTR(InvoiceDate, 1, INSTR(InvoiceDate, '/') - 1)
        
        ELSE SUBSTR(InvoiceDate, 1, INSTR(InvoiceDate, '/') - 1)
    END
    
    AS month,

    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue

FROM orders
WHERE Quantity > 0
GROUP BY month
ORDER BY month;






SELECT

    SUBSTR(
        InvoiceDate,
        LENGTH(InvoiceDate) - 8,
        4
    )

    ||

    '-'

    ||

    CASE
        WHEN LENGTH(
            SUBSTR(
                InvoiceDate,
                1,
                INSTR(InvoiceDate, '/') - 1
            )
        ) = 1

        THEN '0' || SUBSTR(
            InvoiceDate,
            1,
            INSTR(InvoiceDate, '/') - 1
        )

        ELSE SUBSTR(
            InvoiceDate,
            1,
            INSTR(InvoiceDate, '/') - 1
        )
    END

    AS month,

    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue

FROM orders
WHERE Quantity > 0

GROUP BY month
ORDER BY month;


SELECT 
    Country,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue

FROM orders

WHERE Quantity > 0

GROUP BY Country

ORDER BY revenue DESC
LIMIT 10;



SELECT 
    Country,
    ROUND(
        SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo),
        2
    ) AS average_order_value

FROM orders

WHERE Quantity > 0

GROUP BY Country

ORDER BY average_order_value DESC
LIMIT 10;




SELECT 
    InvoiceDate,
    ROUND(SUM(Quantity * UnitPrice), 2) AS revenue

FROM orders

WHERE Quantity > 0

GROUP BY InvoiceDate

ORDER BY InvoiceDate;






SELECT 
    COUNT(DISTINCT InvoiceNo) AS total_orders,
    COUNT(DISTINCT CustomerID) AS total_customers,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_revenue,
    ROUND(SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo), 2) AS average_order_value
FROM orders
WHERE Quantity > 0;




SELECT 
    CustomerID,
    ROUND(SUM(Quantity * UnitPrice), 2) AS total_spent
FROM orders
WHERE Quantity > 0
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;





SELECT 
    Description,
    SUM(Quantity) AS total_quantity_sold
FROM orders
WHERE Quantity > 0
GROUP BY Description
ORDER BY total_quantity_sold DESC
LIMIT 10;





SELECT 
    COUNT(DISTINCT InvoiceNo) AS cancelled_orders
FROM orders
WHERE InvoiceNo LIKE 'C%';
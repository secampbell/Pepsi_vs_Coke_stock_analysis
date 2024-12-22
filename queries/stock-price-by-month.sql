SELECT
    DATE_TRUNC('month', Date) AS Month,
    AVG(Close_Price) AS Avg_Close_Price,
    'Coca-Cola' AS Company
FROM KO_stock_price
GROUP BY Month
UNION ALL
SELECT
    DATE_TRUNC('month', Date) AS Month,
    AVG(Close_Price) AS Avg_Close_Price,
    'PepsiCo' AS Company
FROM PEP_stock_price
GROUP BY Month
ORDER BY Month;

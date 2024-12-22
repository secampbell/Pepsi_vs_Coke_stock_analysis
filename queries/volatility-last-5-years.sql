SELECT
    DATE_TRUNC('year', Date) AS Year,
    AVG(High_Price - Low_Price) AS Avg_Daily_Volatility,
    'Coca-Cola' AS Company
FROM KO_stock_price
WHERE Date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY Year
UNION ALL
SELECT
    DATE_TRUNC('year', Date) AS Year,
    AVG(High_Price - Low_Price) AS Avg_Daily_Volatility,
    'PepsiCo' AS Company
FROM PEP_stock_price
WHERE Date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY Year
ORDER BY Year;

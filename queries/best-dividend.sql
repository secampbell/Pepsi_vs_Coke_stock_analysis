SELECT
    DATE_TRUNC('year', Date) AS Year,
    SUM(Dividend) AS Total_Dividend,
    'Coca-Cola' AS Company
FROM KO_stock_dividend
GROUP BY Year
UNION ALL
SELECT
    DATE_TRUNC('year', Date) AS Year,
    SUM(Dividend) AS Total_Dividend,
    'PepsiCo' AS Company
FROM PEP_stock_dividend
GROUP BY Year
ORDER BY Total_Dividend DESC;

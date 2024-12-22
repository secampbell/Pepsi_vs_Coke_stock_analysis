SELECT
    DATE_TRUNC('year', k.Date) AS Year,
    SUM(k.Dividend) / AVG(p.Close_Price) AS Dividend_Yield,
    'Coca-Cola' AS Company
FROM KO_stock_dividend k
JOIN KO_stock_price p ON DATE_TRUNC('day', k.Date) = DATE_TRUNC('day', p.Date)
GROUP BY Year
UNION ALL
SELECT
    DATE_TRUNC('year', p.Date) AS Year,
    SUM(p.Dividend) / AVG(pe.Close_Price) AS Dividend_Yield,
    'PepsiCo' AS Company
FROM PEP_stock_dividend p
JOIN PEP_stock_price pe ON DATE_TRUNC('day', p.Date) = DATE_TRUNC('day', pe.Date)
GROUP BY Year
ORDER BY Year;

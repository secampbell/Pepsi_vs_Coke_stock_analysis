SELECT
    s.Date AS Split_Date,
    AVG(p.Volume) AS Avg_Volume_Before,
    (
        SELECT AVG(p2.Volume)
        FROM KO_stock_price p2
        WHERE p2.Date BETWEEN s.Date AND s.Date + INTERVAL '30 days'
    ) AS Avg_Volume_After,
    'Coca-Cola' AS Company
FROM KO_stock_split s
JOIN KO_stock_price p ON p.Date BETWEEN s.Date - INTERVAL '30 days' AND s.Date
GROUP BY s.Date
UNION ALL
SELECT
    s.Date AS Split_Date,
    AVG(p.Volume) AS Avg_Volume_Before,
    (
        SELECT AVG(p2.Volume)
        FROM PEP_stock_price p2
        WHERE p2.Date BETWEEN s.Date AND s.Date + INTERVAL '30 days'
    ) AS Avg_Volume_After,
    'PepsiCo' AS Company
FROM PEP_stock_split s
JOIN PEP_stock_price p ON p.Date BETWEEN s.Date - INTERVAL '30 days' AND s.Date
GROUP BY s.Date
ORDER BY Split_Date;

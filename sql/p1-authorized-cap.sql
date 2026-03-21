SELECT 
CASE
    WHEN authorized_cap <= 100000 THEN '<=1L'
    WHEN authorized_cap <= 1000000 THEN '1L-10L'
    WHEN authorized_cap <= 10000000 THEN '10L-1Cr'
    WHEN authorized_cap <= 100000000 THEN '1Cr-10Cr'
    ELSE '>10Cr'
END AS cap_range,
COUNT(*) AS total_companies
FROM company
GROUP BY cap_range
ORDER BY cap_range;